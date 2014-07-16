-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-07-2014 a las 16:18:04
-- Versión del servidor: 5.6.16
-- Versión de PHP: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `inventario_uap`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE IF NOT EXISTS `categoria` (
  `ID_CATEGORIA` int(11) NOT NULL AUTO_INCREMENT,
  `ID_ESTADO` int(11) NOT NULL,
  `CATEGORIA` varchar(30) COLLATE latin1_general_ci DEFAULT NULL,
  `DETALLE_CATEGORIA` varchar(140) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID_CATEGORIA`),
  KEY `FK_RELATIONSHIP_6` (`ID_ESTADO`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`ID_CATEGORIA`, `ID_ESTADO`, `CATEGORIA`, `DETALLE_CATEGORIA`) VALUES
(1, 1, 'Frutas', 'es el area de frutas'),
(2, 1, 'Castaña', 'es el area de Castaña'),
(3, 1, 'Agua', 'es el area de agua');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `CI_C` varchar(40) COLLATE latin1_general_ci NOT NULL,
  `NOMBRE_C` varchar(140) COLLATE latin1_general_ci DEFAULT NULL,
  `APELLIDO_C` varchar(140) COLLATE latin1_general_ci DEFAULT NULL,
  `TELEFONO_C` varchar(140) COLLATE latin1_general_ci DEFAULT NULL,
  `DIRECCION_C` varchar(140) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`CI_C`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`CI_C`, `NOMBRE_C`, `APELLIDO_C`, `TELEFONO_C`, `DIRECCION_C`) VALUES
('65456', 'rodrigo', 'menacho', '159785', 'debajo de una piedra'),
('8888', 'vito', 'marca', '95123544', 'av internacional'),
('jlkde', 'serialmente', 'deldkjl', '555555', 'en el monte');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE IF NOT EXISTS `estado` (
  `ID_ESTADO` int(11) NOT NULL AUTO_INCREMENT,
  `ESTADO` varchar(40) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID_ESTADO`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`ID_ESTADO`, `ESTADO`) VALUES
(1, 'Activo'),
(2, 'Suspendido'),
(3, 'Eliminado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `funcionario`
--

CREATE TABLE IF NOT EXISTS `funcionario` (
  `CI_F` varchar(40) COLLATE latin1_general_ci NOT NULL,
  `ID_ROL` int(11) NOT NULL,
  `ID_ESTADO` int(11) NOT NULL,
  `NOMBRE_F` varchar(140) COLLATE latin1_general_ci DEFAULT NULL,
  `APELLIDO_F` varchar(140) COLLATE latin1_general_ci DEFAULT NULL,
  `TELEFONO_F` varchar(140) COLLATE latin1_general_ci DEFAULT NULL,
  `DIRECCION_F` varchar(140) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`CI_F`),
  KEY `FK_RELATIONSHIP_15` (`ID_ROL`),
  KEY `FK_RELATIONSHIP_4` (`ID_ESTADO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Volcado de datos para la tabla `funcionario`
--

INSERT INTO `funcionario` (`CI_F`, `ID_ROL`, `ID_ESTADO`, `NOMBRE_F`, `APELLIDO_F`, `TELEFONO_F`, `DIRECCION_F`) VALUES
('555', 1, 1, 'juan carlos', 'riveros', '85462', 'el 3'),
('777', 2, 1, 'yosela', 'justiniano', '4788884', 'av porvenir'),
('8887', 2, 1, 'dante', 'elmejor', '821456', 'en el cielo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE IF NOT EXISTS `inventario` (
  `ID_INVENTARIO` int(11) NOT NULL AUTO_INCREMENT,
  `CANTIDAD_STOCK` int(11) DEFAULT NULL,
  `FECHA_INV` date DEFAULT NULL,
  PRIMARY KEY (`ID_INVENTARIO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE IF NOT EXISTS `producto` (
  `COD_PROD` varchar(40) COLLATE latin1_general_ci NOT NULL,
  `ID_CATEGORIA` int(11) NOT NULL,
  `ID_INVENTARIO` int(11) NOT NULL,
  `ID_ESTADO` int(11) NOT NULL,
  `PRODUCTO` varchar(40) COLLATE latin1_general_ci DEFAULT NULL,
  `CANTIDAD` int(11) DEFAULT NULL,
  `OBSERVACION` varchar(140) COLLATE latin1_general_ci DEFAULT NULL,
  `FECHA_INGRESO` date DEFAULT NULL,
  `FECHA_MODIFICACION` date DEFAULT NULL,
  PRIMARY KEY (`COD_PROD`),
  KEY `FK_RELATIONSHIP_10` (`ID_INVENTARIO`),
  KEY `FK_RELATIONSHIP_3` (`ID_ESTADO`),
  KEY `FK_TIENE` (`ID_CATEGORIA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol_cargo`
--

CREATE TABLE IF NOT EXISTS `rol_cargo` (
  `ID_ROL` int(11) NOT NULL AUTO_INCREMENT,
  `CARGO` varchar(40) COLLATE latin1_general_ci DEFAULT NULL,
  `DESCRIPCION` varchar(140) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID_ROL`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `rol_cargo`
--

INSERT INTO `rol_cargo` (`ID_ROL`, `CARGO`, `DESCRIPCION`) VALUES
(1, 'empleado', 'es el empleado de la planta '),
(2, 'administrado', 'mando superior en la planta piloto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salida_producto`
--

CREATE TABLE IF NOT EXISTS `salida_producto` (
  `ID_SALIDA` int(11) NOT NULL AUTO_INCREMENT,
  `CI_F` varchar(40) COLLATE latin1_general_ci NOT NULL,
  `COD_PROD` varchar(40) COLLATE latin1_general_ci NOT NULL,
  `CI_C` varchar(40) COLLATE latin1_general_ci NOT NULL,
  `CANTIDAD` int(11) DEFAULT NULL,
  `FECHA` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_SALIDA`),
  KEY `FK_RELATIONSHIP_11` (`CI_F`),
  KEY `FK_RELATIONSHIP_12` (`CI_C`),
  KEY `FK_RELATIONSHIP_9` (`COD_PROD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `ID_USUARIO` int(11) NOT NULL AUTO_INCREMENT,
  `ID_ESTADO` int(11) NOT NULL,
  `CI_F` varchar(40) COLLATE latin1_general_ci NOT NULL,
  `USUARIO` varchar(140) COLLATE latin1_general_ci DEFAULT NULL,
  `PASSWORD` varchar(140) COLLATE latin1_general_ci DEFAULT NULL,
  `ROL` varchar(140) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID_USUARIO`),
  KEY `FK_RELATIONSHIP_13` (`CI_F`),
  KEY `FK_RELATIONSHIP_14` (`ID_ESTADO`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`ID_USUARIO`, `ID_ESTADO`, `CI_F`, `USUARIO`, `PASSWORD`, `ROL`) VALUES
(1, 1, '555', 'b2afdf253f6c1391022115bbca0cd8b0', 'b2afdf253f6c1391022115bbca0cd8b0', 'administrado_sistema'),
(2, 1, '777', 'ecba395727f462d8863ba6fab50b193b', 'ecba395727f462d8863ba6fab50b193b', 'invitado');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD CONSTRAINT `FK_RELATIONSHIP_6` FOREIGN KEY (`ID_ESTADO`) REFERENCES `estado` (`ID_ESTADO`);

--
-- Filtros para la tabla `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `FK_RELATIONSHIP_15` FOREIGN KEY (`ID_ROL`) REFERENCES `rol_cargo` (`ID_ROL`),
  ADD CONSTRAINT `FK_RELATIONSHIP_4` FOREIGN KEY (`ID_ESTADO`) REFERENCES `estado` (`ID_ESTADO`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `FK_RELATIONSHIP_10` FOREIGN KEY (`ID_INVENTARIO`) REFERENCES `inventario` (`ID_INVENTARIO`),
  ADD CONSTRAINT `FK_RELATIONSHIP_3` FOREIGN KEY (`ID_ESTADO`) REFERENCES `estado` (`ID_ESTADO`),
  ADD CONSTRAINT `FK_TIENE` FOREIGN KEY (`ID_CATEGORIA`) REFERENCES `categoria` (`ID_CATEGORIA`);

--
-- Filtros para la tabla `salida_producto`
--
ALTER TABLE `salida_producto`
  ADD CONSTRAINT `FK_RELATIONSHIP_11` FOREIGN KEY (`CI_F`) REFERENCES `funcionario` (`CI_F`),
  ADD CONSTRAINT `FK_RELATIONSHIP_12` FOREIGN KEY (`CI_C`) REFERENCES `cliente` (`CI_C`),
  ADD CONSTRAINT `FK_RELATIONSHIP_9` FOREIGN KEY (`COD_PROD`) REFERENCES `producto` (`COD_PROD`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `FK_RELATIONSHIP_13` FOREIGN KEY (`CI_F`) REFERENCES `funcionario` (`CI_F`),
  ADD CONSTRAINT `FK_RELATIONSHIP_14` FOREIGN KEY (`ID_ESTADO`) REFERENCES `estado` (`ID_ESTADO`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
