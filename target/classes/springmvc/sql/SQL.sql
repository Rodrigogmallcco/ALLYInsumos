-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 22-07-2018 a las 23:19:51
-- Versión del servidor: 10.1.32-MariaDB
-- Versión de PHP: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mydb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Insumo`
--

CREATE TABLE `Insumo` (
  `idInsumo` int(11) NOT NULL,
  `Usuario_idUsuario` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `cantidad` double NOT NULL,
  `descr` varchar(300) NOT NULL,
  `fecha_ingreso` date NOT NULL COMMENT '	',
  `fecha_salida` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Persona`
--

CREATE TABLE `Persona` (
  `idPersona` int(11) NOT NULL,
  `direccion` varchar(45) NOT NULL COMMENT '			',
  `nombre` varchar(45) NOT NULL,
  `paterno` varchar(45) NOT NULL,
  `materno` varchar(45) NOT NULL,
  `celular` int(11) NOT NULL,
  `email` varchar(45) NOT NULL,
  `dni` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Persona`
--

INSERT INTO `Persona` (`idPersona`, `direccion`, `nombre`, `paterno`, `materno`, `celular`, `email`, `dni`) VALUES
(1, 'ñaña', 'rodrigo', 'gutierrez', 'mallcco', 978205126, 'victorgutirrez@upue.edu.pe', 74850301);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_final`
--

CREATE TABLE `producto_final` (
  `idproducto_final` int(11) NOT NULL,
  `Insumo_idInsumo` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `cantidad` varchar(45) NOT NULL,
  `descripcion` varchar(300) NOT NULL,
  `fecha_entrada` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Rol`
--

CREATE TABLE `Rol` (
  `idRol` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `usuario` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Rol`
--

INSERT INTO `Rol` (`idRol`, `nombre`, `usuario`) VALUES
(1, 'RolAdmin', 'admin'),
(2, 'RolTrabajador', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuario`
--

CREATE TABLE `Usuario` (
  `idUsuario` int(11) NOT NULL,
  `Rol_idRol` int(11) NOT NULL,
  `usuario` varchar(65) NOT NULL,
  `password` varchar(65) NOT NULL,
  `Persona_idPersona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Usuario`
--

INSERT INTO `Usuario` (`idUsuario`, `Rol_idRol`, `usuario`, `password`, `Persona_idPersona`) VALUES
(1, 1, 'admin', '123', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Insumo`
--
ALTER TABLE `Insumo`
  ADD PRIMARY KEY (`idInsumo`),
  ADD KEY `fk_Insumo_Usuario1_idx` (`Usuario_idUsuario`);

--
-- Indices de la tabla `Persona`
--
ALTER TABLE `Persona`
  ADD PRIMARY KEY (`idPersona`);

--
-- Indices de la tabla `producto_final`
--
ALTER TABLE `producto_final`
  ADD PRIMARY KEY (`idproducto_final`),
  ADD KEY `fk_producto_final_Insumo1_idx` (`Insumo_idInsumo`);

--
-- Indices de la tabla `Rol`
--
ALTER TABLE `Rol`
  ADD PRIMARY KEY (`idRol`);

--
-- Indices de la tabla `Usuario`
--
ALTER TABLE `Usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `fk_Usuario_Rol_idx` (`Rol_idRol`),
  ADD KEY `fk_Usuario_Persona1_idx` (`Persona_idPersona`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Insumo`
--
ALTER TABLE `Insumo`
  MODIFY `idInsumo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Persona`
--
ALTER TABLE `Persona`
  MODIFY `idPersona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `producto_final`
--
ALTER TABLE `producto_final`
  MODIFY `idproducto_final` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Rol`
--
ALTER TABLE `Rol`
  MODIFY `idRol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `Usuario`
--
ALTER TABLE `Usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Insumo`
--
ALTER TABLE `Insumo`
  ADD CONSTRAINT `fk_Insumo_Usuario1` FOREIGN KEY (`Usuario_idUsuario`) REFERENCES `Usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `producto_final`
--
ALTER TABLE `producto_final`
  ADD CONSTRAINT `fk_producto_final_Insumo1` FOREIGN KEY (`Insumo_idInsumo`) REFERENCES `Insumo` (`idInsumo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `Usuario`
--
ALTER TABLE `Usuario`
  ADD CONSTRAINT `fk_Usuario_Persona1` FOREIGN KEY (`Persona_idPersona`) REFERENCES `Persona` (`idPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Usuario_Rol` FOREIGN KEY (`Rol_idRol`) REFERENCES `Rol` (`idRol`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
