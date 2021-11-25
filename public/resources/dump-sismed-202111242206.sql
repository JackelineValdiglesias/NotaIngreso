-- MySQL dump 10.13  Distrib 5.7.33, for Win64 (x86_64)
--
-- Host: localhost    Database: sismed
-- ------------------------------------------------------
-- Server version	5.7.33-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `almacen`
--

DROP TABLE IF EXISTS `almacen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `almacen` (
  `Codigo_Alma` varchar(10) NOT NULL,
  `Tipo_Almacen` varchar(20) NOT NULL,
  `Direccion_Almacen` varchar(45) NOT NULL,
  `Encargado_Almacen` varchar(45) NOT NULL,
  PRIMARY KEY (`Codigo_Alma`),
  CONSTRAINT `almacen_ibfk_1` FOREIGN KEY (`Codigo_Alma`) REFERENCES `ubicación_productos` (`Codigo_Alma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almacen`
--

LOCK TABLES `almacen` WRITE;
/*!40000 ALTER TABLE `almacen` DISABLE KEYS */;
INSERT INTO `almacen` VALUES ('1202','ALM DONACIONES','HOSPITAL DE LA SOLIDARIDAD','ABIMAEL CARRION\r'),('12021','ALM DONACIONES','SISOL TACNA','JAVIER CALDERON\r'),('19472','ALM SISMED','C.S. MILITAR FUERTE ARICA','EDUARDO CARPIO\r'),('2346','ALM DONACIONES','SAMU TACNA','MARCO TORRES'),('27953','ALM SISMED','C.S.M.C. VILLA DEL NORTE','FABIAN OSORIO\r'),('2883','ALM DONACIONES','C.M.I. LA ESPERANZA','MARY PAREDES\r'),('2885','ALM DONACIONES','C.M.I. CIUDAD NUEVA','RUDY CONDORI\r'),('2888','ALM DONACIONES','C.M.I. SAN FRANCISCO','LUIS FUENTES\r'),('2899','ALM SISMED','C.S. POCOLLAY','LUIS MILLA\r'),('2909','ALM SISMED','C.S. ILABAYA','SEBASTIAN RAMOS\r'),('2917','ALM SISMED','C.S. BOLOGNESI','LEONARDO PRADO\r'),('2921','ALM SISMED','C.S. METROPOLITANO','ROGELIO AZOCAR\r'),('32345','ALM SISMED','ALMACEN LOGISTICA','MILAGROS INFANTES\r'),('32503','ALM SISMED','SUB ALMACEN RED TACNA','MURIEL SANDOVAL\r'),('410256','ALM SISMED','C.S. LA NATIVIDAD','GERMAN LINARES\r');
/*!40000 ALTER TABLE `almacen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `almacen_pecosa`
--

DROP TABLE IF EXISTS `almacen_pecosa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `almacen_pecosa` (
  `N°PEC` varchar(3) NOT NULL,
  `Codigo_Alma` varchar(3) NOT NULL,
  PRIMARY KEY (`Codigo_Alma`,`N°PEC`),
  KEY `N°PEC` (`N°PEC`),
  CONSTRAINT `almacen_pecosa_ibfk_1` FOREIGN KEY (`N°PEC`) REFERENCES `pecosa` (`N°PEC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almacen_pecosa`
--

LOCK TABLES `almacen_pecosa` WRITE;
/*!40000 ALTER TABLE `almacen_pecosa` DISABLE KEYS */;
/*!40000 ALTER TABLE `almacen_pecosa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certif_analisis`
--

DROP TABLE IF EXISTS `certif_analisis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certif_analisis` (
  `Nom_producto` varchar(80) NOT NULL,
  `N°Lote` varchar(6) NOT NULL,
  `Fec_Vencimiento` date NOT NULL,
  `Cliente` varchar(50) NOT NULL,
  `Ruc_Prove` varchar(11) NOT NULL,
  PRIMARY KEY (`Nom_producto`),
  KEY `Ruc_Prove` (`Ruc_Prove`),
  CONSTRAINT `certif_analisis_ibfk_1` FOREIGN KEY (`Ruc_Prove`) REFERENCES `proveedor` (`RUC_Prove`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certif_analisis`
--

LOCK TABLES `certif_analisis` WRITE;
/*!40000 ALTER TABLE `certif_analisis` DISABLE KEYS */;
INSERT INTO `certif_analisis` VALUES ('ACIDO ACETICO','B10686','2022-01-04','OQ PHARMA SAC','20413950291'),('ACIDO ACETILSALICILICO','B10687','2025-01-12','OQ PHARMA SAC','20425334177'),('ACIDO ALENDRONICO','B10688','2023-01-26','OQ PHARMA SAC','20472068741'),('ACIDO FOLICO','B10689','2024-02-09','OQ PHARMA SAC','20560584470'),('ACIDO FOLICO + FERROSO SULFATO (Equiv. de Hierro elemental)','B10691','2022-02-25','OQ PHARMA SAC','20529654713'),('ACIDO FUSIDICO','B10690','2022-02-15','OQ PHARMA SAC','20529654713'),('AMOXICILINA','B10692','2024-02-24','OQ PHARMA SAC','20560684906'),('BIPROL','B10693','2022-03-07','OQ PHARMA SAC','20452848656'),('DIMENHIDRINATO','B10694','2023-03-12','OQ PHARMA SAC','20513977376'),('DISPOSITIVO INTRAUTERINO DE COBRE','B10695','2022-03-17','OQ PHARMA SAC','20669669936'),('DISULFIRAM','B10696','2024-04-02','OQ PHARMA SAC','20511799590'),('DOSAJE DE COCAINA','B10697','2022-04-08','OQ PHARMA SAC','20418386078'),('DOSAJE DE MARIHUANA','B10698','2022-04-12','OQ PHARMA SAC','20517966084'),('DOXICICLINA','B10699','2023-04-21','OQ PHARMA SAC','20626085231'),('EMTRICITABINA + TENOFOVIR','B10700','2024-05-03','OQ PHARMA SAC','20412844651'),('ENALAPRIL MALEATO','B10701','2023-05-17','OQ PHARMA SAC','20592675209'),('LIDOCAINA CLORHIDRATO SIN PRESERVANTES','B10702','2022-05-25','OQ PHARMA SAC','20627366581'),('LINEZOLID','B10703','2023-06-11','OQ PHARMA SAC','20423987756'),('LLAVE DE TRIPLE VIA CON EXTENSION ','B10704','2023-06-16','OQ PHARMA SAC','20597167047'),('LOPINAVIR + RITONAVIR','B10705','2025-06-21','OQ PHARMA SAC','20475696926'),('LORATADINA','B10706','2022-07-06','OQ PHARMA SAC','20548581235'),('LOSARTAN POTASICO','B10707','2023-07-12','OQ PHARMA SAC','20413950291'),('LUGOL SOLUCION','B10708','2022-07-25','OQ PHARMA SAC','20425334177'),('MAGNESIO SULFATO','B10709','2022-08-02','OQ PHARMA SAC','20472068741'),('MASCARA DE OXIGENO CON RESERVORIO ','B10710','2023-08-15','OQ PHARMA SAC','20560584470'),('NIFEDIPINO (TABLETA DE LIBERACION MODIFICADA)','B10711','2022-08-22','OQ PHARMA SAC','20529654713'),('NITROFURAL','B10712','2023-08-28','OQ PHARMA SAC','20560684906'),('NITROFURANTOINA','B10713','2022-09-04','OQ PHARMA SAC','20452848656'),('OMEPRAZOL','B10714','2023-09-14','OQ PHARMA SAC','20513977376'),('ORFENADRINA CITRATO','B10715','2025-09-22','OQ PHARMA SAC','20669669936'),('OXITOCINA','B10716','2023-09-28','OQ PHARMA SAC','20511799590'),('PAPEL ARTICULAR 1 ARCADA X 12','B10717','2024-10-06','OQ PHARMA SAC','20418386078'),('PARACETAMOL','B10718','2025-10-14','OQ PHARMA SAC','20517966084'),('PIRAZINAMIDA','B10719','2024-10-28','OQ PHARMA SAC','20626085231'),('PIRIDOXINA CLORHIDRATO','B10720','2023-11-02','OQ PHARMA SAC','20412844651'),('POLIGELINA','B10721','2022-11-14','OQ PHARMA SAC','20592675209'),('POTASIO CLORURO','B10722','2025-11-19','OQ PHARMA SAC','20627366581'),('PRAZICUANTEL','B10723','2025-11-24','OQ PHARMA SAC','20423987756'),('PREDNISOLONA (SUSPENSION OFTALMICA)','B10724','2025-11-25','OQ PHARMA SAC','20592675209'),('PREDNISONA','B10725','2022-12-02','OQ PHARMA SAC','20597167047'),('PRESERVATIVO FEMENINO','B10726','2024-12-12','OQ PHARMA SAC','20475696926'),('PRESERVATIVOS SIN NONOXINOL','B10727','2022-12-17','OQ PHARMA SAC','20548581235');
/*!40000 ALTER TABLE `certif_analisis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distribuye`
--

DROP TABLE IF EXISTS `distribuye`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `distribuye` (
  `Codigo_Alma` varchar(8) NOT NULL,
  `Codigo_EBL` varchar(8) NOT NULL,
  PRIMARY KEY (`Codigo_Alma`,`Codigo_EBL`),
  KEY `Codigo_EBL` (`Codigo_EBL`),
  CONSTRAINT `distribuye_ibfk_1` FOREIGN KEY (`Codigo_Alma`) REFERENCES `almacen` (`Codigo_Alma`),
  CONSTRAINT `distribuye_ibfk_2` FOREIGN KEY (`Codigo_EBL`) REFERENCES `establecimiento` (`Codigo_EBL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distribuye`
--

LOCK TABLES `distribuye` WRITE;
/*!40000 ALTER TABLE `distribuye` DISABLE KEYS */;
/*!40000 ALTER TABLE `distribuye` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `establecimiento`
--

DROP TABLE IF EXISTS `establecimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `establecimiento` (
  `Codigo_EBL` varchar(8) NOT NULL,
  `Nombre` varchar(40) NOT NULL,
  `N°GuiaD` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`Codigo_EBL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `establecimiento`
--

LOCK TABLES `establecimiento` WRITE;
/*!40000 ALTER TABLE `establecimiento` DISABLE KEYS */;
INSERT INTO `establecimiento` VALUES ('102345','Centro Salud 28 de Agosto','NULL\r'),('102346','Centro Salud Alto Alianza','NULL\r'),('102347','Centro Salud Alto Peru','NULL\r'),('102348','Centro Salud Augusto B. Leguia','NULL\r'),('201345','Centro Salud Bolognesi','NULL\r'),('201347','Centro Salud Candarave','NULL\r'),('201546','Centro Salud Ciudad Nueva','NULL\r'),('301245','Centro Salud Ilabaya','NULL\r'),('301478','Centro Salud La Esperanza','NULL\r'),('410256','Centro Salud La natividad','NULL\r'),('501456','Centro Salud Leoncio Prado','NULL\r'),('601245','Puesto de Salud Jesus Maria','NULL\r'),('601246','Puesto de Salud Cono Norte','NULL\r');
/*!40000 ALTER TABLE `establecimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guia_devolucion`
--

DROP TABLE IF EXISTS `guia_devolucion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guia_devolucion` (
  `N°GuiaD` varchar(9) NOT NULL,
  `N°Nota` varchar(10) NOT NULL,
  `Cod_Establecimiento` varchar(8) NOT NULL,
  `Encargado` varchar(20) NOT NULL,
  `Concepto` varchar(50) NOT NULL,
  PRIMARY KEY (`N°GuiaD`),
  KEY `N°Nota` (`N°Nota`),
  KEY `Cod_Establecimiento` (`Cod_Establecimiento`),
  CONSTRAINT `guia_devolucion_ibfk_1` FOREIGN KEY (`N°Nota`) REFERENCES `nota_ingreso` (`N°Nota`),
  CONSTRAINT `guia_devolucion_ibfk_2` FOREIGN KEY (`Cod_Establecimiento`) REFERENCES `establecimiento` (`Codigo_EBL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guia_devolucion`
--

LOCK TABLES `guia_devolucion` WRITE;
/*!40000 ALTER TABLE `guia_devolucion` DISABLE KEYS */;
INSERT INTO `guia_devolucion` VALUES ('100','21-0001634','102345','MARY PAREDES','DEVOLUCION POR DETERIORO\r'),('1001','21-0001640','102346','GERMAN LINARES','DEVOLUCION POR SOBRESTOCK\r'),('1002','21-0001646','102348','FABIAN OSORIO','DEVOLUCION POR SOBRESTOCK\r'),('1003','21-0001650','301245','SEBASTIAN RAMOS','DEVOLUCION POR SOBRESTOCK\r'),('101','21-0001644','201546','RUDY CONDORI','DEVOLUCION POR DETERIORO\r'),('102','21-0001651','301478','EDUARDO CARPIO','DEVOLUCION POR DETERIORO\r'),('1050','21-0001631','102347','LEONARDO PRADO','DEVOLUCION POR VENCIMIENTO\r'),('1051','21-0001638','201345','MARCO TORRES','DEVOLUCION POR VENCIMIENTO\r'),('1052','21-0001641','201347','LUIS MILLA','DEVOLUCION POR VENCIMIENTO\r'),('1053','21-0001643','410256','JAVIER CALDERON','DEVOLUCION POR VENCIMIENTO');
/*!40000 ALTER TABLE `guia_devolucion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guia_remision`
--

DROP TABLE IF EXISTS `guia_remision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guia_remision` (
  `N°_GuiaR` varchar(7) NOT NULL,
  `Cod_cliente` varchar(11) NOT NULL,
  `Motivo_traslado` varchar(40) NOT NULL,
  `Transportista` varchar(50) NOT NULL,
  `Fecha_origen` date NOT NULL,
  `Fecha_traslado` date NOT NULL,
  `Destinatario` varchar(50) NOT NULL,
  `RUC_Prove` varchar(11) NOT NULL,
  PRIMARY KEY (`N°_GuiaR`),
  KEY `RUC_Prove` (`RUC_Prove`),
  CONSTRAINT `guia_remision_ibfk_1` FOREIGN KEY (`RUC_Prove`) REFERENCES `proveedor` (`RUC_Prove`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guia_remision`
--

LOCK TABLES `guia_remision` WRITE;
/*!40000 ALTER TABLE `guia_remision` DISABLE KEYS */;
INSERT INTO `guia_remision` VALUES ('1015','20929','Traslado a zona primaria','Claudio Molina Manrique','2021-03-20','2021-03-25','Arequia','20529654713'),('1030','90520','Compra','Gabriel Mendoza Mendoza','2021-04-30','2021-05-05','Tacna','20597167047'),('1047','88462','Producto mal ambientado','Carlos Ortega Huamani','2021-06-18','2021-06-23','Tacna','20511799590'),('1104','37477','Compra','Martin Zuniga Mamani','2021-02-01','2021-02-06','Tacna','20627366581'),('1125','43539','Traslado a zona primaria','Jorge Yanque Huaman ','2021-05-27','2021-06-01','Arequia','20548581235'),('1223','51608','Traslado a zona primaria','Luis Pumacayo Cayo','2021-04-23','2021-04-28','Tacna','20517966084'),('1325','89798','Traslado almacen itinerante','Alejandra Melgar Nunez','2021-01-01','2021-01-06','Arequia','20560584470'),('1356','21921','Traslado almacen itinerante','Jose Rivera Mamani ','2021-08-19','2021-08-24','Arequia','20412844651'),('1443','56108','Compra','Julio Fuenzalida Valdivia','2021-01-01','2021-01-06','Arequia','20423987756'),('1461','79593','Compra','Manuel Callata Llaza','2021-02-27','2021-03-04','Tacna','20472068741'),('1535','49708','Consignacion','Diego Yanque Falcon','2021-04-16','2021-04-21','Arequia','20560684906'),('1557','89530','Traslado almacen itinerante','Fabian Molina Huaman ','2021-05-07','2021-05-12','Arequia','20626085231'),('1566','56646','Producto mal ambientado','Mathias Nunez Pilco','2021-06-30','2021-07-05','Tacna','20592675209'),('1601','93410','Producto en malas condiciones','Andros Paredes Monroy','2021-04-30','2021-05-05','Arequia','20513977376'),('1729','42572','Producto mal ambientado','Juan Perez Marquez','2021-01-20','2021-01-25','Tacna','20413950291'),('1814','11817','Producto en malas condiciones','Alberto Mamani Marquez','2021-03-17','2021-03-22','Arequia','20425334177'),('1898','15999','Compra','Jorge Carpio Huanca','2021-06-17','2021-06-22','Tacna','20418386078'),('1955','35622','Traslado almacen itinerante','Alberto Nomal Carco','2021-04-23','2021-04-28','Arequia','20452848656'),('1974','67949','Compra','Antoni Olanda Mendoza','2021-07-25','2021-07-30','Tacna','20669669936'),('1997','24026','Traslado a zona primaria','Nicolas Portillo Huaman','2021-08-01','2021-08-06','Tacna','20475696926');
/*!40000 ALTER TABLE `guia_remision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nota_ingreso`
--

DROP TABLE IF EXISTS `nota_ingreso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nota_ingreso` (
  `N°Nota` varchar(10) NOT NULL,
  `Tip_Doc_Origen` varchar(30) NOT NULL,
  `Proveedor` varchar(15) NOT NULL,
  `Nro_Doc_Origen` varchar(9) NOT NULL,
  `Mes` int(11) NOT NULL,
  `Año` int(11) NOT NULL,
  `Dia` int(11) NOT NULL,
  `Hora` time NOT NULL,
  PRIMARY KEY (`N°Nota`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nota_ingreso`
--

LOCK TABLES `nota_ingreso` WRITE;
/*!40000 ALTER TABLE `nota_ingreso` DISABLE KEYS */;
INSERT INTO `nota_ingreso` VALUES ('21-0001628','DEVOLUCION X DETERIORO','20425334177','1047',10,2021,15,'15:49:00'),('21-0001629','DEVOLUCION X DETERIORO','20425334177','1047',10,2021,15,'15:49:00'),('21-0001630','DEVOLUCION X DETERIORO','20425334177','1047',10,2021,15,'15:49:00'),('21-0001631','DEVOLUCION X DETERIORO','20425334177','1047',10,2021,15,'15:49:00'),('21-0001632','DEVOLUCION X DETERIORO','20425334177','1047',10,2021,15,'15:49:00'),('21-0001633','DEVOLUCION X DETERIORO','20425334177','1047',10,2021,15,'15:49:00'),('21-0001634','DEVOLUCION X DETERIORO','20425334177','1047',10,2021,15,'15:49:00'),('21-0001635','DEVOLUCION X DETERIORO','20425334177','1047',10,2021,15,'15:49:00'),('21-0001636','DEVOLUCION X DETERIORO','20425334177','1047',10,2021,15,'15:49:00'),('21-0001637','DEVOLUCION X DETERIORO','20425334177','1047',10,2021,15,'15:49:00'),('21-0001638','DEVOLUCION X DETERIORO','20425334177','1047',10,2021,15,'15:49:00'),('21-0001639','DEVOLUCION X DETERIORO','20425334177','1047',10,2021,15,'15:49:00'),('21-0001640','DEVOLUCION X DETERIORO','20425334177','1047',10,2021,15,'15:49:00'),('21-0001641','DEVOLUCION X DETERIORO','20425334177','1047',10,2021,15,'15:49:00'),('21-0001642','DEVOLUCION X DETERIORO','20425334177','1047',10,2021,15,'15:49:00'),('21-0001643','DEVOLUCION X DETERIORO','20425334177','1047',10,2021,15,'15:49:00'),('21-0001644','DEVOLUCION X DETERIORO','20425334177','1047',10,2021,15,'15:49:00'),('21-0001645','DEVOLUCION X DETERIORO','20425334177','1047',10,2021,15,'15:49:00'),('21-0001646','DEVOLUCION X DETERIORO','20425334177','1047',10,2021,15,'15:49:00'),('21-0001647','DEVOLUCION X DETERIORO','20425334177','1047',10,2021,15,'15:49:00'),('21-0001648','DEVOLUCION X DETERIORO','20425334177','1047',10,2021,15,'15:49:00'),('21-0001649','DEVOLUCION X DETERIORO','20425334177','1047',10,2021,15,'15:49:00'),('21-0001650','DEVOLUCION X DETERIORO','20425334177','1047',10,2021,15,'15:49:00'),('21-0001651','DEVOLUCION X DETERIORO','20425334177','1047',10,2021,15,'15:49:00'),('21-0001652','DEVOLUCION X DETERIORO','20425334177','1047',10,2021,15,'15:49:00'),('21-0001653','DEVOLUCION X DETERIORO','20425334177','1047',10,2021,15,'15:49:00'),('21-0001654','DEVOLUCION X DETERIORO','20425334177','1047',10,2021,15,'15:49:00'),('21-0001655','DEVOLUCION X DETERIORO','20425334177','1047',10,2021,15,'15:49:00'),('21-0001656','DEVOLUCION X DETERIORO','20425334177','1047',10,2021,15,'15:49:00'),('21-0001657','DEVOLUCION X DETERIORO','20425334177','1047',10,2021,15,'15:49:00'),('21-0001658','DEVOLUCION X DETERIORO','20425334177','1047',10,2021,15,'15:49:00'),('21-0001659','DEVOLUCION X DETERIORO','20425334177','1047',10,2021,15,'15:49:00'),('21-0001660','DEVOLUCION X DETERIORO','20425334177','1047',10,2021,15,'15:49:00'),('21-0001661','DEVOLUCION X DETERIORO','20425334177','1047',10,2021,15,'15:49:00'),('21-0001662','DEVOLUCION X DETERIORO','20425334177','1047',10,2021,15,'15:49:00'),('21-0001663','DEVOLUCION X DETERIORO','20425334177','1047',10,2021,15,'15:49:00'),('21-0001664','DEVOLUCION X DETERIORO','20425334177','1047',10,2021,15,'15:49:00'),('21-0001665','DEVOLUCION X DETERIORO','20425334177','1047',10,2021,15,'15:49:00'),('21-0001666','DEVOLUCION X DETERIORO','20425334177','1047',10,2021,15,'15:49:00'),('21-0001667','DEVOLUCION X DETERIORO','20425334177','1047',10,2021,15,'15:49:00'),('21-0001668','DEVOLUCION X DETERIORO','20425334177','1047',10,2021,15,'15:49:00'),('21-0001669','DEVOLUCION X DETERIORO','20425334177','1047',10,2021,15,'15:49:00'),('21-0029384','DEVOLUCION X DETERIORO','20425334177','1047',10,2021,15,'15:49:00'),('22-0001629','DEVOLUCION X DETERIORO','20425334177','1047',11,2021,22,'21:56:00');
/*!40000 ALTER TABLE `nota_ingreso` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`urem`@`%`*/ /*!50003 TRIGGER bef_eliminar_nota_ingreso BEFORE delete
    ON nota_ingreso FOR EACH ROW
	delete from producto_nota_ingreso where `N°Nota`=old.`N°Nota` */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `orden_compra`
--

DROP TABLE IF EXISTS `orden_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orden_compra` (
  `N°Orden_Compra` varchar(7) NOT NULL,
  `IGV` float(10,2) unsigned DEFAULT NULL,
  `Tipo_Proceso` varchar(15) NOT NULL,
  `Concepto` varchar(150) NOT NULL,
  `Total_Orden_Compra` float(10,2) unsigned DEFAULT NULL,
  `RUC_Prove` varchar(11) NOT NULL,
  `Fecha_Origen` date NOT NULL,
  `N°Nota` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`N°Orden_Compra`),
  KEY `N°Nota` (`N°Nota`),
  CONSTRAINT `orden_compra_ibfk_1` FOREIGN KEY (`N°Nota`) REFERENCES `nota_ingreso` (`N°Nota`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_compra`
--

LOCK TABLES `orden_compra` WRITE;
/*!40000 ALTER TABLE `orden_compra` DISABLE KEYS */;
INSERT INTO `orden_compra` VALUES ('0001047',7.32,'ASP','Por la adquisicion de la compra institucional de productos farmaceuticos, a fin de garantizar la disponibilidad de los mismos.',48.00,'20413950291','2021-08-26','21-0001628'),('0001048',3.36,'ASP','Por la adquisicion de la compra institucional de productos farmaceuticos, a fin de garantizar la disponibilidad de los mismos.',22.00,'20472068741','2021-08-27','21-0001630'),('0001049',4.27,'ASP','Por la adquisicion de la compra institucional de productos farmaceuticos, a fin de garantizar la disponibilidad de los mismos.',28.00,'20529654713','2021-08-28','21-0001632'),('0001050',5.95,'ASP','Por la adquisicion de la compra institucional de productos farmaceuticos, a fin de garantizar la disponibilidad de los mismos.',39.00,'20560684906','2021-08-29','21-0001633'),('0001051',8.01,'ASP','Por la adquisicion de la compra institucional de productos farmaceuticos, a fin de garantizar la disponibilidad de los mismos.',52.50,'20513977376','2021-08-30','21-0001635'),('0001052',14.87,'ASP','Por la adquisicion de la compra institucional de productos farmaceuticos, a fin de garantizar la disponibilidad de los mismos.',97.50,'20669669936','2021-08-31','21-0001636'),('0001053',9.34,'ASP','Por la adquisicion de la compra institucional de productos farmaceuticos, a fin de garantizar la disponibilidad de los mismos.',61.20,'20511799590','2021-09-01','21-0001637'),('0001054',28.75,'ASP','Por la adquisicion de la compra institucional de productos farmaceuticos, a fin de garantizar la disponibilidad de los mismos.',188.50,'20517966084','2021-09-02','21-0001639'),('0001055',4.49,'ASP','Por la adquisicion de la compra institucional de productos farmaceuticos, a fin de garantizar la disponibilidad de los mismos.',29.40,'20597167047','2021-09-03','21-0001645'),('0001056',430.32,'ASP','Por la adquisicion de la compra institucional de productos farmaceuticos, a fin de garantizar la disponibilidad de los mismos.',282.10,'20452848656','2021-09-04','21-0001647'),('0001057',149.49,'ASP','Por la adquisicion de la compra institucional de productos farmaceuticos, a fin de garantizar la disponibilidad de los mismos.',980.00,'20517966084','2021-09-05','21-0001652'),('0001058',54.92,'ASP','Por la adquisicion de la compra institucional de productos farmaceuticos, a fin de garantizar la disponibilidad de los mismos.',360.00,'20412844651','2021-09-06','21-0001654'),('0001059',85.81,'ASP','Por la adquisicion de la compra institucional de productos farmaceuticos, a fin de garantizar la disponibilidad de los mismos.',562.50,'20627366581','2021-09-07','21-0001656'),('0001060',283.73,'ASP','Por la adquisicion de la compra institucional de productos farmaceuticos, a fin de garantizar la disponibilidad de los mismos.',1860.00,'20475696926','2021-09-08','21-0001659'),('0001061',123.56,'ASP','Por la adquisicion de la compra institucional de productos farmaceuticos, a fin de garantizar la disponibilidad de los mismos.',810.00,'20560584470','2021-09-09','21-0001663'),('0001062',187.63,'LP','Por la adquisicion de la compra institucional de productos farmaceuticos, a fin de garantizar la disponibilidad de los mismos.',1230.00,'20425334177','2021-09-10','21-0001665'),('0001063',153.56,'ASP','Por la adquisicion de la compra institucional de productos farmaceuticos, a fin de garantizar la disponibilidad de los mismos.',810.00,'20560584470','2021-09-09','21-0001668'),('0001064',167.63,'LP','Por la adquisicion de la compra institucional de productos farmaceuticos, a fin de garantizar la disponibilidad de los mismos.',1230.00,'20425334177','2021-09-10','21-0001669');
/*!40000 ALTER TABLE `orden_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pecosa`
--

DROP TABLE IF EXISTS `pecosa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pecosa` (
  `N°PEC` varchar(3) NOT NULL,
  `N°Nota` varchar(10) NOT NULL,
  `N°PPA` int(11) NOT NULL,
  `Concepto` varchar(30) NOT NULL,
  `Importe_Total` decimal(8,2) unsigned DEFAULT NULL,
  `Fecha_emision` date NOT NULL,
  `Fecha_recepcion` date NOT NULL,
  PRIMARY KEY (`N°PEC`),
  KEY `N°Nota` (`N°Nota`),
  CONSTRAINT `pecosa_ibfk_1` FOREIGN KEY (`N°Nota`) REFERENCES `nota_ingreso` (`N°Nota`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pecosa`
--

LOCK TABLES `pecosa` WRITE;
/*!40000 ALTER TABLE `pecosa` DISABLE KEYS */;
INSERT INTO `pecosa` VALUES ('804','21-0001628',615,'Transfencias:Otras',136576.00,'2021-08-23','2021-08-28'),('805','21-0001629',616,'Transfencias:Otras',135422.00,'2021-03-28','2021-04-01'),('806','21-0001630',617,'Transfencias:Otras',185612.00,'2021-06-16','2021-06-20'),('807','21-0001631',618,'Transfencias:Otras',154126.00,'2021-04-12','2021-04-19'),('808','21-0001632',619,'Transfencias:Otras',285812.00,'2021-05-18','2021-05-21'),('809','21-0001633',620,'Transfencias:Otras',159422.00,'2021-11-19','2021-11-24'),('810','21-0001634',621,'Transfencias:Otras',654674.00,'2021-10-21','2021-10-25'),('811','21-0001635',622,'Transfencias:Otras',184822.00,'2021-12-15','2021-12-19'),('812','21-0001636',623,'Transfencias:Otras',122455.00,'2021-09-10','2021-09-14'),('813','21-0001637',624,'Transfencias:Otras',182854.00,'2021-07-26','2021-07-30');
/*!40000 ALTER TABLE `pecosa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ppa`
--

DROP TABLE IF EXISTS `ppa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppa` (
  `N°PPA` int(11) NOT NULL,
  `N°Orden_Compra` varchar(7) NOT NULL,
  PRIMARY KEY (`N°PPA`),
  KEY `N°Orden_Compra` (`N°Orden_Compra`),
  CONSTRAINT `ppa_ibfk_1` FOREIGN KEY (`N°Orden_Compra`) REFERENCES `orden_compra` (`N°Orden_Compra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppa`
--

LOCK TABLES `ppa` WRITE;
/*!40000 ALTER TABLE `ppa` DISABLE KEYS */;
INSERT INTO `ppa` VALUES (1,'0001047'),(2,'0001048'),(3,'0001049'),(4,'0001050'),(5,'0001051'),(6,'0001052'),(7,'0001053'),(8,'0001054'),(9,'0001055'),(10,'0001056'),(11,'0001057'),(12,'0001058'),(13,'0001059'),(14,'0001060'),(15,'0001061'),(16,'0001062'),(25,'0001063'),(26,'0001064');
/*!40000 ALTER TABLE `ppa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto` (
  `Cod_Producto` varchar(3) NOT NULL,
  `Fecha_vencimiento` date NOT NULL,
  `Descripcion` varchar(45) NOT NULL,
  `Precio_unitario` decimal(10,0) NOT NULL,
  `Nom_producto` varchar(45) NOT NULL,
  `Codigo_EBL` varchar(8) NOT NULL,
  `N°PEC` int(11) DEFAULT NULL,
  `N°Orden_Compra` varchar(7) DEFAULT NULL,
  `RUC_Prove` varchar(11) NOT NULL,
  `Codigo_Alma` varchar(7) NOT NULL,
  PRIMARY KEY (`Cod_Producto`),
  KEY `RUC_Prove` (`RUC_Prove`),
  KEY `Nom_producto` (`Nom_producto`),
  KEY `Codigo_EBL` (`Codigo_EBL`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`RUC_Prove`) REFERENCES `proveedor` (`RUC_Prove`),
  CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`Nom_producto`) REFERENCES `certif_analisis` (`Nom_producto`),
  CONSTRAINT `producto_ibfk_3` FOREIGN KEY (`Codigo_EBL`) REFERENCES `establecimiento` (`Codigo_EBL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES ('101','2023-07-31','ACIDO ACETICO - 5% - SOLUCI - 500 mL',1,'ACIDO ACETICO','102345',0,'1047','20413950291','2885\r'),('102','2022-06-30','ACIDO ACETILSALICILICO - 100 mg - TABLET -',3,'ACIDO ACETILSALICILICO','102346',0,'1048','20425334177','32503\r'),('103','2023-12-30','ACIDO ALENDRONICO - 70 mg - TABLET -',1,'ACIDO ALENDRONICO','102347',0,'1049','20472068741','1202\r'),('104','2023-12-29','ACIDO FOLICO - 500 ',1,'ACIDO FOLICO','102348',250,'','20560584470','2917\r'),('105','2023-08-31','ACIDO FOLICO - 500 ',1,'ACIDO FOLICO','201345',251,'','20529654713','12021\r'),('108','2022-10-30','ACIDO FUSIDICO - 2 g/100 g - CREMA - 15 g',2,'ACIDO FUSIDICO','201347',0,'1051','20513977376','2909\r'),('109','2030-07-30','ACIDO FUSIDICO - 2 g/100 g - CREMA - 15 g',2,'ACIDO FUSIDICO','201546',0,'1052','20669669936','410256\r'),('110','2023-08-31','DIMENHIDRINATO - 50 mg - INYECT - 5 mL',2,'DIMENHIDRINATO','301245',0,'1053','20511799590','32345\r'),('111','2024-06-30','DISPOSITIVO INTRAUTERINO DE COBRE -  - UNIDAD',5,'DISPOSITIVO INTRAUTERINO DE COBRE','301478',0,'1054','20418386078','2883\r'),('112','2023-02-21','DISULFIRAM - 500 mg - TABLET -',3,'DISULFIRAM','410256',0,'1055','20517966084','2888\r'),('113','2023-02-21','DOSAJE DE COCAINA -  - KIT - 40 DET',3,'DOSAJE DE COCAINA','501456',0,'1055','20626085231','2921\r'),('114','2023-02-28','DOSAJE DE MARIHUANA -  - KIT - 40 DET',3,'DOSAJE DE MARIHUANA','601245',0,'1055','20412844651','2899\r'),('115','2024-02-28','DOXICICLINA - 100 mg - TABLET ',2,'DOXICICLINA','601246',0,'1056','20592675209','19472\r'),('116','2021-01-31','DOXICICLINA - 100 mg - TABLET ',4,'DOXICICLINA','102345',0,'1056','20627366581','27953\r'),('117','2022-11-30','EMTRICITABINA + TENOFOVIR - 200 mg + 300 mg -',1,'EMTRICITABINA + TENOFOVIR','102346',0,'1057','20423987756','2346\r'),('118','2023-04-30','EMTRICITABINA + TENOFOVIR - 200 mg + 300 mg -',1,'EMTRICITABINA + TENOFOVIR','102347',0,'1058','20597167047','2885\r'),('119','2023-08-30','ENALAPRIL MALEATO - 10 mg - TABLET ',3,'ENALAPRIL MALEATO','102348',0,'1059','20475696926','32503\r'),('120','2023-04-24','ENALAPRIL MALEATO - 10 mg - TABLET ',3,'ENALAPRIL MALEATO','201345',0,'1060','20548581235','1202\r'),('121','2023-03-30','LIDOCAINA CLORHIDRATO SIN PRESERVANTES - 2 g/',4,'LIDOCAINA CLORHIDRATO SIN PRESERVANTES','201347',0,'1061','20413950291','2917\r'),('122','2022-10-20','LINEZOLID - 600 mg - TABLET ',2,'LINEZOLID','201546',0,'1062','20425334177','12021\r'),('123','2023-06-14','LLAVE DE TRIPLE VIA CON EXTENSION X 50 cm -  ',3,'LLAVE DE TRIPLE VIA CON EXTENSION ','301245',252,'','20472068741','2909\r'),('124','2023-06-06','LLAVE DE TRIPLE VIA CON EXTENSION X 50 cm -  ',3,'LLAVE DE TRIPLE VIA CON EXTENSION ','301478',252,'','20560584470','410256\r'),('125','2023-05-27','LOPINAVIR + RITONAVIR - 200 mg + 50 mg - TABL',1,'LOPINAVIR + RITONAVIR','410256',252,'','20529654713','32345\r'),('126','2023-06-14','LORATADINA - 5 mg/5 mL - JARABE - 60 mL',1,'LORATADINA','501456',0,'1062','20560684906','2883\r'),('127','2024-05-31','LOSARTAN POTASICO - 50 mg - TABLET ',1,'LOSARTAN POTASICO','601245',0,'1062','20452848656','2888\r'),('128','2023-07-21','LUGOL SOLUCION -  - SOLUCI - 250 mL',1,'LUGOL SOLUCION','601246',254,'','20513977376','2921\r'),('129','2023-05-18','MAGNESIO SULFATO - 200 mg/mL - INYECT - 10 mL',2,'MAGNESIO SULFATO','102345',0,'1075','20669669936','2899\r'),('130','2023-03-31','MASCARA DE OXIGENO CON RESERVORIO PARA USO PE',3,'MASCARA DE OXIGENO CON RESERVORIO ','102346',0,'1076','20511799590','19472\r'),('131','2025-02-28','NIFEDIPINO (TABLETA DE LIBERACION MODIFICADA)',3,'NIFEDIPINO (TABLETA DE LIBERACION MODIFICADA)','102347',0,'1075','20418386078','27953\r'),('132','2024-12-14','NITROFURAL - 200 mg/100 g - CREMA - 500 g',2,'NITROFURAL','102348',253,'','20517966084','2346\r'),('133','2024-01-21','NITROFURANTOINA - 100 mg - TABLET ',2,'NITROFURANTOINA','201345',0,'1062','20626085231','2885\r'),('134','2022-10-25','OMEPRAZOL - 20 mg - TABLET ',3,'OMEPRAZOL','201347',253,'','20412844651','32503\r'),('135','2022-10-13','ORFENADRINA CITRATO - 30 mg/mL - INYECT - 2 m',2,'ORFENADRINA CITRATO','201546',0,'1079','20592675209','1202\r'),('136','2023-09-29','ORFENADRINA CITRATO - 30 mg/mL - INYECT - 2 m',2,'ORFENADRINA CITRATO','301245',0,'1076','20627366581','2917\r'),('137','2023-11-28','ORFENADRINA CITRATO - 100 mg - TABLET ',2,'ORFENADRINA CITRATO','301478',253,'','20423987756','12021\r'),('138','2022-07-31','OXITOCINA - 10 UI - INYECT - 1 mL',2,'OXITOCINA','410256',0,'','20597167047','2909\r'),('139','2022-11-30','PAPEL ARTICULAR 1 ARCADA X 12 -  - UNIDAD ',3,'PAPEL ARTICULAR 1 ARCADA X 12','501456',254,'','20475696926','410256\r'),('140','2022-07-31','PARACETAMOL - 100 mg/mL - SOLUCI - 10 mL',0,'PARACETAMOL','601245',0,'1079','20548581235','32345\r'),('141','2023-11-30','PARACETAMOL - 120 mg/5 mL - JARABE - 60 mL',1,'PARACETAMOL','601246',0,'1076','20413950291','2883\r'),('142','2022-05-31','PIRAZINAMIDA - 500 mg - TABLET ',2,'PIRAZINAMIDA','102345',254,'','20425334177','2888\r'),('143','2023-02-28','PIRIDOXINA CLORHIDRATO - 50 mg - TABLET ',1,'PIRIDOXINA CLORHIDRATO','102346',0,'1075','20472068741','2921\r'),('144','2021-10-31','POLIGELINA - 3.5 g/100 mL (3.5 %) - INYECT - ',1,'POLIGELINA','102347',0,'1076','20560584470','2899\r'),('145','2021-10-31','POTASIO CLORURO - 20 g/100 mL - INYECT - 10 m',0,'POTASIO CLORURO','102348',0,'1050','20529654713','19472\r'),('146','2023-06-30','PRAZICUANTEL - 150 mg - TABLET ',1,'PRAZICUANTEL','201345',0,'1079','20560684906','27953\r'),('147','2023-06-30','PREDNISOLONA (SUSPENSION OFTALMICA) - 10 mg/m',1,'PREDNISOLONA (SUSPENSION OFTALMICA)','201347',0,'1050','20452848656','2346\r'),('148','2022-03-31','PREDNISONA - 5 mg/5 mL - JARABE - 120 mL',1,'PREDNISONA','201546',0,'1050','20513977376','2885\r'),('149','2022-10-31','PREDNISONA - 20 mg - TABLET ',1,'PREDNISONA','301245',0,'1079','20669669936','32503\r'),('150','2021-11-30','PRESERVATIVO FEMENINO -  - UNIDAD ',4,'PRESERVATIVO FEMENINO','301478',0,'1080','20511799590','1202\r'),('151','2022-10-31','PRESERVATIVOS SIN NONOXINOL -  - UNIDAD ',4,'PRESERVATIVOS SIN NONOXINOL','410256',0,'','20418386078','2917');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_guia_devolucion`
--

DROP TABLE IF EXISTS `producto_guia_devolucion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto_guia_devolucion` (
  `N°GuiaD` varchar(9) NOT NULL,
  `Cod_Producto` varchar(12) NOT NULL,
  `Cant_Producto` int(10) unsigned NOT NULL,
  PRIMARY KEY (`N°GuiaD`,`Cod_Producto`),
  CONSTRAINT `producto_guia_devolucion_ibfk_1` FOREIGN KEY (`N°GuiaD`) REFERENCES `guia_devolucion` (`N°GuiaD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_guia_devolucion`
--

LOCK TABLES `producto_guia_devolucion` WRITE;
/*!40000 ALTER TABLE `producto_guia_devolucion` DISABLE KEYS */;
INSERT INTO `producto_guia_devolucion` VALUES ('100','101',40),('1001','102',30),('1002','104',15),('1003','108',35),('101','107',24),('102','109',65),('1050','103',20),('1051','105',20),('1052','106',30),('1053','110',34);
/*!40000 ALTER TABLE `producto_guia_devolucion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_nota_ingreso`
--

DROP TABLE IF EXISTS `producto_nota_ingreso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto_nota_ingreso` (
  `N°Nota` varchar(10) NOT NULL,
  `Cod_Producto` varchar(12) NOT NULL,
  `Cant_Producto` int(10) unsigned NOT NULL,
  `Importe` decimal(10,2) unsigned DEFAULT NULL,
  PRIMARY KEY (`N°Nota`,`Cod_Producto`),
  CONSTRAINT `producto_nota_ingreso_ibfk_1` FOREIGN KEY (`N°Nota`) REFERENCES `nota_ingreso` (`N°Nota`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_nota_ingreso`
--

LOCK TABLES `producto_nota_ingreso` WRITE;
/*!40000 ALTER TABLE `producto_nota_ingreso` DISABLE KEYS */;
INSERT INTO `producto_nota_ingreso` VALUES ('21-0001628','112',40,120.00),('21-0001629','102',30,99.00),('21-0001629','105',12,12.00),('21-0001630','103',20,22.00),('21-0001631','104',15,21.00),('21-0001632','105',20,28.00),('21-0001633','106',30,39.00),('21-0001634','107',24,31.20),('21-0001635','108',35,52.50),('21-0001636','109',65,97.50),('21-0001637','110',34,61.20),('21-0001638','111',23,124.20),('21-0001639','112',65,188.50),('21-0001640','113',44,140.80),('21-0001641','114',41,131.20),('21-0001642','115',31,46.50),('21-0001643','116',66,29.20),('21-0001644','117',71,99.40),('21-0001645','118',21,29.40),('21-0001646','119',82,254.20),('21-0001647','120',91,282.10);
/*!40000 ALTER TABLE `producto_nota_ingreso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_orden_compra`
--

DROP TABLE IF EXISTS `producto_orden_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto_orden_compra` (
  `N°Orden_Compra` varchar(7) NOT NULL,
  `Cod_Producto` varchar(12) NOT NULL,
  `Cant_Producto` int(10) unsigned NOT NULL,
  `Precio_Total` decimal(8,2) unsigned DEFAULT NULL,
  PRIMARY KEY (`N°Orden_Compra`,`Cod_Producto`),
  CONSTRAINT `producto_orden_compra_ibfk_1` FOREIGN KEY (`N°Orden_Compra`) REFERENCES `orden_compra` (`N°Orden_Compra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_orden_compra`
--

LOCK TABLES `producto_orden_compra` WRITE;
/*!40000 ALTER TABLE `producto_orden_compra` DISABLE KEYS */;
INSERT INTO `producto_orden_compra` VALUES ('0001047','101',40,48.00),('0001048','103',20,22.00),('0001049','105',20,28.00),('0001050','106',30,39.00),('0001051','108',35,52.50),('0001052','109',65,97.50),('0001053','110',34,61.20),('0001054','112',65,188.50),('0001055','118',21,29.40),('0001056','120',91,282.10),('0001057','104',700,980.00),('0001058','110',200,360.00),('0001059','108',375,562.50),('0001060','119',600,1860.00),('0001061','122',450,810.00),('0001062','121',300,1230.00),('0001063','122',450,810.00),('0001064','121',300,1230.00);
/*!40000 ALTER TABLE `producto_orden_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedor` (
  `RUC_Prove` varchar(11) NOT NULL,
  `Nom_Prove` varchar(50) NOT NULL,
  `Direc_Prove` varchar(50) NOT NULL,
  `Representante_emp` varchar(50) NOT NULL,
  PRIMARY KEY (`RUC_Prove`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES ('20412844651','ALMACENES MEDICOS PERUANOS E.I.R.L.','Urb. Los Jeranios M9','Luis Lipa Mamani\r'),('20413950291','A. TARRILLO BARBA S.A.','Urb Solar de challapampa P7','Juan Velazco Goicochea\r'),('20418386078','ALKOFARMA E.I.R.L.','Urb. Pomar B7','Joel Angulo Pumacota\r'),('20423987756','APEX CORPORACION INDUSTRIAL E IMPORTACIONES EIRL','Urb. Francisco Mostajo A2','Sandro Cabana Heredia\r'),('20425334177','ABASMEDIC E.I.R.L','Urb Peralta M8','Martin Goicochea Perez\r'),('20452848656','ALBIS S.A.','Urb. Pomar A5','Renato Vizcarra Alcca\r'),('20472068741','AC FARMA S.A.','Av. Soles del campo 255','Diego Martinez Peralta\r'),('20475696926','ARGOS MEDICAL IMPORT S.R.L.','Urb. Quintasori A6','Ana Paredes Falcon\r'),('20511799590','ALKHOFAR S.A.C.','Urb Solar de challapampa Z8','Adolfo Lipa Barrios\r'),('20513977376','ALFARO S.A.C.','Los Angeles de Cayma B1','Andres Guzman Peralta\r'),('20517966084','ALMACENERA MEDICA S.R.L.','Urb. Los Rosales 23','Percy Ari Torres\r'),('20529654713','ACFARMA E.I.R.L.','Av. Camana 156','Angel Aguirre Obando\r'),('20548581235','ARTIMAR CLEAN S.A.C.','Urb. Los Pastores B1','Pablo Fernandez Heredia\r'),('20560584470','ACCORD HEALTHCARE S.A.C.','Av. Jorge Belaunde Terry 22','Alexander Ramizer Acuna\r'),('20560684906','ADVANCE SCIENTIF MEDIC S.A.C.','Urb. Los girasoles G10','Carlos Ala Acuna\r'),('20592675209','ANDINA MEDICA FILIAL PERU','Av. Cayma 234','Dyana Calle Angulo\r'),('20597167047','AREL MEDICA S.A.C.','Urb. La florida N5','Paul Gamboa Salamanca\r'),('20626085231','ALMACENES FARMACEUTICOS S.A.C.','Av. Jorge Belaunde Terry 156','Richard Acuna Vizcarra\r'),('20627366581','ANDINA MEDICA FILIAL PERU','Av. Independencia 334','Jose Salinas Carpio\r'),('20669669936','ALFY MEDICA EIRL','Av. Retamas 233','Yusef Alvarano Samayi\r');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro_sanitario`
--

DROP TABLE IF EXISTS `registro_sanitario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registro_sanitario` (
  `Reg_Sanitario` varchar(8) NOT NULL,
  `Fec_Vencimiento` date NOT NULL,
  PRIMARY KEY (`Reg_Sanitario`),
  KEY `idx_Reg` (`Reg_Sanitario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_sanitario`
--

LOCK TABLES `registro_sanitario` WRITE;
/*!40000 ALTER TABLE `registro_sanitario` DISABLE KEYS */;
INSERT INTO `registro_sanitario` VALUES ('EE-10001','2021-01-04'),('EE-10002','2021-01-12'),('EE-10003','2021-01-26'),('EE-10004','2021-02-09'),('EE-10005','2021-02-15'),('EE-10006','2021-02-24'),('EE-10007','2021-03-07'),('EE-10008','2021-03-12'),('EE-10009','2021-03-17'),('EE-10010','2021-04-02'),('EE-10011','2021-04-08'),('EE-10012','2021-04-12'),('EE-10013','2021-04-21'),('EE-10014','2021-05-03'),('EE-10015','2021-05-17'),('EE-10016','2021-05-25'),('EE-10017','2021-06-11'),('EE-10018','2021-06-16'),('EE-10019','2021-06-21'),('EE-10020','2021-07-06'),('EE-10021','2021-07-12'),('EE-10022','2021-07-22'),('EE-10023','2021-08-02'),('EE-10024','2021-08-15'),('EE-10025','2021-08-22'),('EE-10026','2021-08-28'),('EE-10027','2021-09-04'),('EE-10028','2021-09-14'),('EE-10029','2021-09-22'),('EE-10030','2021-09-28'),('EE-10031','2021-10-06'),('EE-10032','2021-10-14'),('EE-10033','2021-10-28'),('EE-10034','2021-11-02'),('EE-10035','2021-11-14'),('EE-10036','2021-11-19'),('EE-10037','2021-11-24'),('EE-10038','2021-12-02'),('EE-10039','2021-12-12'),('EE-10040','2021-12-17');
/*!40000 ALTER TABLE `registro_sanitario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resol_directorial`
--

DROP TABLE IF EXISTS `resol_directorial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resol_directorial` (
  `N°_RD` varchar(7) NOT NULL,
  `Reg_Sanitario` varchar(8) NOT NULL,
  `RUC_Prove` varchar(11) NOT NULL,
  `Nom_producto` varchar(60) NOT NULL,
  `Cod_Empresa` varchar(11) NOT NULL,
  PRIMARY KEY (`N°_RD`,`Reg_Sanitario`),
  KEY `Reg_Sanitario` (`Reg_Sanitario`),
  KEY `RUC_Prove` (`RUC_Prove`),
  CONSTRAINT `resol_directorial_ibfk_1` FOREIGN KEY (`Reg_Sanitario`) REFERENCES `registro_sanitario` (`Reg_Sanitario`),
  CONSTRAINT `resol_directorial_ibfk_2` FOREIGN KEY (`RUC_Prove`) REFERENCES `proveedor` (`RUC_Prove`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resol_directorial`
--

LOCK TABLES `resol_directorial` WRITE;
/*!40000 ALTER TABLE `resol_directorial` DISABLE KEYS */;
INSERT INTO `resol_directorial` VALUES ('RD-1001','EE-10001','20413950291','A. TARRILLO BARBA S.A.','123456\r'),('RD-1002','EE-10002','20413950291','A. TARRILLO BARBA S.A.','123456\r'),('RD-1003','EE-10003','20413950291','A. TARRILLO BARBA S.A.','123456\r'),('RD-1004','EE-10004','20425334177','ABASMEDIC E.I.R.L','498741\r'),('RD-1005','EE-10005','20425334177','ABASMEDIC E.I.R.L','498741\r'),('RD-1006','EE-10006','20425334177','ABASMEDIC E.I.R.L','498741\r'),('RD-1007','EE-10007','20472068741','AC FARMA S.A.','545815\r'),('RD-1008','EE-10008','20560584470','ACCORD HEALTHCARE S.A.C.','456879\r'),('RD-1009','EE-10009','20560584470','ACCORD HEALTHCARE S.A.C.','456879\r'),('RD-1010','EE-10010','20529654713','ACFARMA E.I.R.L.','489213\r'),('RD-1011','EE-10011','20529654713','ACFARMA E.I.R.L.','489213\r'),('RD-1012','EE-10012','20560684906','ADVANCE SCIENTIF MEDIC S.A.C.','918851\r'),('RD-1013','EE-10013','20452848656','ALBIS S.A.','152456\r'),('RD-1014','EE-10014','20452848656','ALBIS S.A.','152456\r'),('RD-1015','EE-10015','20513977376','ALFARO S.A.C.','456845\r'),('RD-1016','EE-10016','20513977376','ALFARO S.A.C.','456845\r'),('RD-1017','EE-10017','20669669936','ALFY MEDICA EIRL','891891\r'),('RD-1018','EE-10018','20511799590','ALKHOFAR S.A.C.','487546\r'),('RD-1019','EE-10019','20511799590','ALKHOFAR S.A.C.','487546\r'),('RD-1020','EE-10020','20511799590','ALKHOFAR S.A.C.','487546\r'),('RD-1021','EE-10021','20418386078','ALKOFARMA E.I.R.L.','848542\r'),('RD-1022','EE-10022','20418386078','ALKOFARMA E.I.R.L.','848542\r'),('RD-1023','EE-10023','20418386078','ALKOFARMA E.I.R.L.','848542\r'),('RD-1024','EE-10024','20418386078','ALKOFARMA E.I.R.L.','848542\r'),('RD-1025','EE-10025','20517966084','ALMACENERA MEDICA S.R.L.','875469\r'),('RD-1026','EE-10026','20626085231','ALMACENES FARMACEUTICOS S.A.C.','124565\r'),('RD-1027','EE-10027','20626085231','ALMACENES FARMACEUTICOS S.A.C.','124565\r'),('RD-1028','EE-10028','20626085231','ALMACENES FARMACEUTICOS S.A.C.','124565\r'),('RD-1029','EE-10029','20626085231','ALMACENES FARMACEUTICOS S.A.C.','124565\r'),('RD-1030','EE-10030','20412844651','ALMACENES MEDICOS PERUANOS E.I.R.L.','748579\r'),('RD-1031','EE-10031','20412844651','ALMACENES MEDICOS PERUANOS E.I.R.L.','748579\r'),('RD-1032','EE-10032','20412844651','ALMACENES MEDICOS PERUANOS E.I.R.L.','748579\r'),('RD-1033','EE-10033','20592675209','ANDINA MEDICA FILIAL PERU','875421\r'),('RD-1034','EE-10034','20627366581','ANDINA MEDICA FILIAL PERU','875421\r'),('RD-1035','EE-10035','20627366581','ANDINA MEDICA FILIAL PERU','875421\r'),('RD-1036','EE-10036','20627366581','ANDINA MEDICA FILIAL PERU','875421\r'),('RD-1037','EE-10037','20423987756','APEX CORPORACION INDUSTRIAL E IMPORTACIONES EIRL','8975421\r'),('RD-1038','EE-10038','20423987756','APEX CORPORACION INDUSTRIAL E IMPORTACIONES EIRL','8975421\r'),('RD-1039','EE-10039','20423987756','APEX CORPORACION INDUSTRIAL E IMPORTACIONES EIRL','8975421\r'),('RD-1040','EE-10040','20597167047','AREL MEDICA S.A.C.','987542\r');
/*!40000 ALTER TABLE `resol_directorial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubicación_productos`
--

DROP TABLE IF EXISTS `ubicación_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubicación_productos` (
  `Codigo_Alma` varchar(10) NOT NULL,
  `Ubicación_Productos` varchar(30) NOT NULL,
  PRIMARY KEY (`Codigo_Alma`,`Ubicación_Productos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubicación_productos`
--

LOCK TABLES `ubicación_productos` WRITE;
/*!40000 ALTER TABLE `ubicación_productos` DISABLE KEYS */;
INSERT INTO `ubicación_productos` VALUES ('1202','ZONA-C\r'),('12021','ZONA-E\r'),('19472','ZONA-M\r'),('2346','ZONA-O\r'),('27953','ZONA-N\r'),('2883','ZONA-I\r'),('2885','ZONA-A\r'),('2888','ZONA-J\r'),('2899','ZONA-L\r'),('2909','ZONA-F\r'),('2917','ZONA-D\r'),('2921','ZONA-K\r'),('32345','ZONA-H\r'),('32503','ZONA-B\r'),('410256','ZONA-G\r');
/*!40000 ALTER TABLE `ubicación_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'sismed'
--
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_nota_ingreso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_nota_ingreso`(in N°Nota varchar(10))
BEGIN
	delete from nota_ingreso where N°Nota=N°Nota;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eli_produ_nota_ingreso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eli_produ_nota_ingreso`(in nro varchar(10), in codprod varchar(12))
BEGIN
 delete from producto_nota_ingreso where N°Nota=nro and Cod_Producto=codprod;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllNota` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`urem`@`%` PROCEDURE `getAllNota`()
BEGIN
	Select nip.N°Nota as nro,concat(Año,'-',Mes,'-',Dia)as fecha,
		sum(nip.importe) as total,
		Tip_Doc_Origen as tip,
		Nro_Doc_Origen as nrDoc
	From Nota_Ingreso 
	INNER JOIN Producto_Nota_Ingreso nip ON Nota_Ingreso.N°Nota=nip.N°Nota
	group By(nip.N°Nota);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllNotasProd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`urem`@`%` PROCEDURE `getAllNotasProd`(IN id varchar(10))
BEGIN
    SELECT p.Nom_Producto as nom, pni.Cod_Producto as codprod, pni.Cant_Producto 
	    as cantprod, p.Precio_Unitario as precio, p.Fecha_vencimiento as fechav, pni.Importe as importe FROM Producto_Nota_Ingreso pni LEFT JOIN Producto p
	    ON p.Cod_Producto=pni.Cod_Producto 
	    WHERE pni.N°Nota=id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getListPrecio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`urem`@`%` PROCEDURE `getListPrecio`()
BEGIN
	SELECT Cod_producto as cod, (concat(Nom_Producto,' (',Precio_Unitario,' S/.)')) as pre FROM Producto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getListProd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`urem`@`%` PROCEDURE `getListProd`()
BEGIN
	SELECT Cod_producto as cod, (concat(Nom_Producto,' (',Precio_Unitario,' S/.)')) as pre FROM Producto;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getNota` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`urem`@`%` PROCEDURE `getNota`(IN id varchar(10))
BEGIN
	Select *,concat(Año,'-',Mes,'-',Dia) as fecha From Nota_Ingreso Where N°Nota=id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetProd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetProd`(in id varchar(3),in nro varchar(10))
BEGIN
	select pni.*,p.Precio_Unitario as precio
	    from Producto p join producto_nota_ingreso pni 
	    on p.Cod_Producto = pni.Cod_Producto
	    where pni.Cod_Producto = id and pni.N°Nota = nro;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getProdPrecio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`urem`@`%` PROCEDURE `getProdPrecio`(IN id varchar(3))
BEGIN
	SELECT p.Precio_Unitario as precio FROM Producto p WHERE p.Cod_Producto = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_produ_nota_ingreso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_produ_nota_ingreso`(in N°Nota varchar(10), in Cod_Producto varchar(12), in Cant_Producto int, in Importe decimal(10,2))
BEGIN
INSERT INTO producto_nota_ingreso (N°Nota,Cod_Producto,Cant_Producto,Importe)
VALUES (N°Nota,Cod_Producto,Cant_Producto,Importe);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ins_nota_ingreso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ins_nota_ingreso`(in N°Nota varchar(10),in Tip_Doc_Origen varchar(30),in Proveedor varchar(15),in Nro_Doc_Origen varchar(9),in Mes int,in Año int ,in Dia int,in Hora time)
BEGIN
	insert into nota_ingreso values(N°Nota,Tip_Doc_Origen,Proveedor,Nro_Doc_Origen,Mes,Año,Dia,Hora);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ListaNotaIngreso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ListaNotaIngreso`()
BEGIN
SELECT * FROM nota_ingreso order by mes+dia DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ListaProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ListaProducto`()
BEGIN
SELECT * FROM producto order by Cod_Producto asc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ListaProveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ListaProveedor`()
BEGIN
	SELECT RUC_Prove,Nom_Prove FROM proveedor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ListProve` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ListProve`()
BEGIN
	select RUC_Prove, concat(RUC_Prove,' - ',Nom_Prove) as 'Nombre proveedor' from proveedor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mod_nota_ingreso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mod_nota_ingreso`(in N°Nota varchar(10),in Tip_Doc_Origen varchar(30),in Proveedor varchar(15),in Nro_Doc_Origen varchar(9),in Mes int,in Año int ,in Dia int,in Hora time)
BEGIN
	update nota_ingreso
    set 
    Tip_Doc_Origen= Tip_Doc_Origen,
	Proveedor=Proveedor,
    Nro_Doc_Origen=Nro_Doc_Origen,
    Mes=Mes,
    Año=Año,
    Dia=Dia,
    Hora=Hora
    where N°Nota=N°Nota;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mod_prod_nota_ingreso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mod_prod_nota_ingreso`(in N°Nota varchar(10), in Cod_Producto varchar(12), in Cant_Producto int, in Importe decimal(10,2))
BEGIN
update producto_nota_ingreso pni
    set 
    pni.N°Nota=N°Nota,
    pni.Cod_Producto=Cod_Producto,
    pni.Cant_Producto=Cant_Producto,
    pni.Importe=Importe
    where pni.N°Nota=N°Nota and pni.Cod_Producto=Cod_Producto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_insertar_nota_ingreso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_insertar_nota_ingreso`(in N°Nota varchar(10),in Tip_Doc_Origen varchar(30),in Proveedor varchar(15),in Nro_Doc_Origen varchar(9),in Mes int,in Año int ,in Dia int,in Hora time)
BEGIN
INSERT INTO nota_ingreso (N°Nota, Tip_Doc_Origen,Proveedor,Nro_Doc_Origen ,Mes ,Año ,Dia,Hora)
VALUES (N°Nota, Tip_Doc_Origen,Proveedor, Nro_Doc_Origen, Mes,Año ,Dia,Hora);
end ;;
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

-- Dump completed on 2021-11-24 22:06:08
