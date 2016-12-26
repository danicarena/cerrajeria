/*
Navicat MySQL Data Transfer

Source Server         : danicarena.tk
Source Server Version : 50553
Source Host           : 52.26.64.212:3306
Source Database       : cerrajeria

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2016-12-26 16:31:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for clientes
-- ----------------------------
DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) CHARACTER SET utf8 NOT NULL,
  `cuit` decimal(10,0) DEFAULT NULL,
  `direccion` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `telefono` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `codigo` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `debe` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of clientes
-- ----------------------------

-- ----------------------------
-- Table structure for facturas
-- ----------------------------
DROP TABLE IF EXISTS `facturas`;
CREATE TABLE `facturas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tipo_de_factura_id` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`id`,`tipo_de_factura_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_facturas_tipo_de_factura1_idx` (`tipo_de_factura_id`),
  CONSTRAINT `fk_facturas_tipo_de_factura1` FOREIGN KEY (`tipo_de_factura_id`) REFERENCES `tipo_de_factura` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of facturas
-- ----------------------------

-- ----------------------------
-- Table structure for proveedores
-- ----------------------------
DROP TABLE IF EXISTS `proveedores`;
CREATE TABLE `proveedores` (
  `id` int(4) unsigned NOT NULL,
  `nombre` varchar(45) CHARACTER SET utf8 NOT NULL,
  `cuit` decimal(10,0) DEFAULT NULL,
  `direccion` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `telefono` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `codigo` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `debe` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of proveedores
-- ----------------------------

-- ----------------------------
-- Table structure for rel_stock_clientes
-- ----------------------------
DROP TABLE IF EXISTS `rel_stock_clientes`;
CREATE TABLE `rel_stock_clientes` (
  `stock_id` int(10) unsigned NOT NULL,
  `clientes_id` int(4) unsigned NOT NULL,
  `cantidad` int(3) unsigned NOT NULL,
  `precioParcial` decimal(6,2) unsigned NOT NULL,
  `facturas_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`stock_id`,`clientes_id`,`facturas_id`),
  KEY `fk_stock_has_clientes_clientes1_idx` (`clientes_id`),
  KEY `fk_stock_has_clientes_stock1_idx` (`stock_id`),
  KEY `fk_rel_stock_clientes_facturas1_idx` (`facturas_id`),
  CONSTRAINT `fk_stock_has_clientes_stock1` FOREIGN KEY (`stock_id`) REFERENCES `stock` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stock_has_clientes_clientes1` FOREIGN KEY (`clientes_id`) REFERENCES `clientes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_rel_stock_clientes_facturas1` FOREIGN KEY (`facturas_id`) REFERENCES `facturas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rel_stock_clientes
-- ----------------------------

-- ----------------------------
-- Table structure for stock
-- ----------------------------
DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` mediumtext,
  `cantidad` int(3) NOT NULL,
  `FKproveedores` int(4) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_stock_proveedores_idx` (`FKproveedores`),
  CONSTRAINT `fk_stock_proveedores` FOREIGN KEY (`FKproveedores`) REFERENCES `proveedores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stock
-- ----------------------------

-- ----------------------------
-- Table structure for tipo_de_factura
-- ----------------------------
DROP TABLE IF EXISTS `tipo_de_factura`;
CREATE TABLE `tipo_de_factura` (
  `id` tinyint(2) unsigned NOT NULL,
  `tipo` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idtipo_de_factura_UNIQUE` (`id`),
  UNIQUE KEY `tipo_UNIQUE` (`tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tipo_de_factura
-- ----------------------------
