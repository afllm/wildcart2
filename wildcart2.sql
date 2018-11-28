-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 23-11-2018 a las 08:24:07
-- Versión del servidor: 5.7.23
-- Versión de PHP: 7.1.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `wildcart`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `id` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `iva` float DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`id`, `fecha`, `iva`, `id_usuario`) VALUES
(1, '2018-11-20 00:00:00', 20, 51),
(2, '2018-10-20 00:00:00', 20, 51),
(3, '2018-09-20 00:00:00', 20, 51),
(4, '2018-08-20 00:00:00', 20, 51),
(5, '2018-07-20 00:00:00', 20, 51);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `linea`
--

CREATE TABLE `linea` (
  `id` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `id_factura` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` int(11) NOT NULL,
  `codigo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `existencias` int(11) DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `foto` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_tipoProducto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `codigo`, `desc`, `existencias`, `precio`, `foto`, `id_tipoProducto`) VALUES
(1, 'FF5S78', 'Manubrio para cortar', 12, 45, 'foto1', 2),
(3, 'MN87FH', 'Aparejo de repasar', 12, 854, 'foto4', 1),
(4, 'NE5S78', 'Herramienta de pulir', 124, 123, 'foto3', 1),
(5, '098DNF', 'Utensilio de afilar', 67, 854, 'foto4', NULL),
(6, 'NE5S78', 'Manubrio de pulir', 124, 854, 'foto2', 2),
(7, 'MN87FH', 'Utensilio de afilar', 124, 854, 'foto1', 2),
(8, 'NE5S78', 'Manubrio de cortar', 89, 58, 'foto2', 1),
(9, 'UT46SD', 'Utensilio de afilar', 89, 854, 'foto5', 1),
(10, '9GJ5T6F', 'Manubrio de cortar', 124, 58, 'foto1', 1),
(11, '9GJ5T6F', 'Manubrio de cortar', 124, 854, 'foto2', NULL),
(12, 'NE5S78', 'Manubrio de cortar', 43, 123, 'foto1', 2),
(13, 'MN87FH', 'Herramienta de pulir', 67, 89, 'foto3', 3),
(14, 'UT46SD', 'Utensilio para repasar', 12, 854, 'foto5', 3),
(15, '098DNF', 'Herramienta de pulir', 43, 854, 'foto3', NULL),
(16, '9GJ5T6F', 'Utensilio para repasar', 89, 89, 'foto5', NULL),
(17, 'MN87FH', 'Palanca de repasar', 12, 58, 'foto2', 3),
(18, '9GJ5T6F', 'Palanca de repasar', 89, 89, 'foto5', 2),
(19, 'UT46SD', 'Palanca de repasar', 67, 123, 'foto3', NULL),
(20, '9GJ5T6F', 'Utensilio para repasar', 43, 58, 'foto5', 3),
(21, '9GJ5T6F', 'Utensilio para repasar', 67, 45, 'foto4', 1),
(22, 'MN87FH', 'Utensilio de afilar', 89, 45, 'foto5', NULL),
(23, '9GJ5T6F', 'Palanca de repasar', 12, 58, 'foto5', 1),
(24, '9GJ5T6F', 'Herramienta de pulir', 124, 854, 'foto2', 1),
(25, 'MN87FH', 'Herramienta de pulir', 124, 89, 'foto5', 1),
(26, 'UT46SD', 'Utensilio para repasar', 67, 123, 'foto4', 2),
(27, 'NE5S78', 'Herramienta de pulir', 43, 89, 'foto5', NULL),
(28, '9GJ5T6F', 'Utensilio de afilar', 67, 89, 'foto1', NULL),
(29, '098DNF', 'Palanca de repasar', 12, 89, 'foto5', 2),
(30, '098DNF', 'Palanca de repasar', 43, 45, 'foto3', NULL),
(31, '098DNF', 'Palanca de repasar', 124, 89, 'foto1', 3),
(32, 'NE5S78', 'Utensilio de afilar', 12, 123, 'foto4', NULL),
(33, '098DNF', 'Palanca de repasar', 12, 45, 'foto5', 1),
(34, '098DNF', 'Herramienta de pulir', 89, 45, 'foto5', 2),
(35, 'NE5S78', 'Herramienta de pulir', 67, 89, 'foto4', 1),
(36, 'UT46SD', 'Herramienta de pulir', 89, 123, 'foto4', 1),
(37, 'UT46SD', 'Herramienta de pulir', 124, 45, 'foto5', NULL),
(38, 'MN87FH', 'Palanca de repasar', 43, 854, 'foto2', NULL),
(39, 'UT46SD', 'Utensilio de afilar', 124, 58, 'foto4', NULL),
(40, 'MN87FH', 'Palanca de repasar', 89, 58, 'foto3', 1),
(41, 'UT46SD', 'Palanca de repasar', 124, 854, 'foto5', 1),
(42, '9GJ5T6F', 'Palanca de repasar', 89, 123, 'foto5', 1),
(43, '9GJ5T6F', 'Palanca de repasar', 43, 89, 'foto1', 1),
(44, 'UT46SD', 'Herramienta de pulir', 43, 89, 'foto5', 3),
(45, '098DNF', 'Utensilio para repasar', 12, 854, 'foto5', NULL),
(46, '098DNF', 'Herramienta de pulir', 43, 58, 'foto2', 2),
(47, '9GJ5T6F', 'Herramienta de pulir', 124, 123, 'foto3', 1),
(48, 'MN87FH', 'Herramienta de pulir', 43, 45, 'foto3', 2),
(49, '098DNF', 'Palanca de repasar', 67, 89, 'foto4', 1),
(50, '9GJ5T6F', 'Utensilio para repasar', 43, 854, 'foto4', 2),
(51, 'MN87FH', 'Utensilio de afilar', 67, 123, 'foto4', 2),
(52, '098DNF', 'Herramienta de pulir', 89, 45, 'foto2', 1),
(53, 'UT46SD', 'Utensilio para repasar', 67, 45, 'foto3', 1),
(54, '098DNF', 'Utensilio de afilar', 89, 58, 'foto3', 1),
(55, 'UT46SD', 'Palanca de repasar', 67, 123, 'foto1', 2),
(56, 'NE5S78', 'Utensilio para repasar', 67, 854, 'foto5', 2),
(57, 'UT46SD', 'Palanca de repasar', 43, 58, 'foto4', NULL),
(58, '9GJ5T6F', 'Herramienta de pulir', 43, 123, 'foto2', 2),
(59, '9GJ5T6F', 'Herramienta de pulir', 124, 58, 'foto5', NULL),
(60, '9GJ5T6F', 'Palanca de repasar', 124, 854, 'foto3', NULL),
(61, 'NE5S78', 'Utensilio para repasar', 124, 45, 'foto2', 2),
(62, '098DNF', 'Herramienta de pulir', 12, 123, 'foto5', 2),
(63, 'MN87FH', 'Herramienta de pulir', 43, 854, 'foto1', 2),
(64, 'MN87FH', 'Herramienta de pulir', 89, 854, 'foto1', 1),
(65, '9GJ5T6F', 'Utensilio para repasar', 12, 89, 'foto4', 3),
(66, '098DNF', 'Herramienta de pulir', 67, 854, 'foto2', NULL),
(67, 'MN87FH', 'Utensilio para repasar', 89, 854, 'foto5', 1),
(68, '098DNF', 'Palanca de repasar', 43, 58, 'foto3', 1),
(69, '098DNF', 'Utensilio de afilar', 124, 123, 'foto1', 1),
(70, 'UT46SD', 'Utensilio para repasar', 43, 45, 'foto4', NULL),
(71, '098DNF', 'Utensilio para repasar', 43, 45, 'foto2', 2),
(72, '9GJ5T6F', 'Utensilio de afilar', 12, 123, 'foto5', NULL),
(73, 'UT46SD', 'Palanca de repasar', 43, 89, 'foto2', 2),
(74, '098DNF', 'Herramienta de pulir', 67, 123, 'foto5', NULL),
(75, 'MN87FH', 'Palanca de repasar', 43, 58, 'foto3', NULL),
(76, '098DNF', 'Utensilio para repasar', 67, 123, 'foto1', NULL),
(77, 'MN87FH', 'Palanca de repasar', 89, 854, 'foto2', 1),
(78, '098DNF', 'Palanca de repasar', 43, 89, 'foto4', 2),
(79, '9GJ5T6F', 'Herramienta de pulir', 43, 89, 'foto1', 2),
(80, '098DNF', 'Utensilio para repasar', 12, 123, 'foto5', 3),
(81, '9GJ5T6F', 'Palanca de repasar', 89, 58, 'foto4', NULL),
(82, '9GJ5T6F', 'Utensilio para repasar', 12, 58, 'foto1', 3),
(83, 'UT46SD', 'Herramienta de pulir', 43, 89, 'foto4', NULL),
(84, '9GJ5T6F', 'Utensilio de afilar', 43, 45, 'foto4', NULL),
(85, '9GJ5T6F', 'Palanca de repasar', 43, 45, 'foto2', 3),
(86, '9GJ5T6F', 'Utensilio de afilar', 124, 89, 'foto1', 2),
(87, 'UT46SD', 'Palanca de repasar', 89, 123, 'foto2', 2),
(88, 'NE5S78', 'Utensilio de afilar', 43, 123, 'foto3', 3),
(89, 'MN87FH', 'Utensilio de afilar', 12, 854, 'foto3', 1),
(90, 'MN87FH', 'Utensilio para repasar', 67, 123, 'foto2', NULL),
(91, '098DNF', 'Utensilio de afilar', 124, 123, 'foto4', 1),
(92, 'NE5S78', 'Palanca de repasar', 124, 45, 'foto5', 2),
(93, 'NE5S78', 'Palanca de repasar', 89, 89, 'foto1', NULL),
(94, '9GJ5T6F', 'Utensilio de afilar', 67, 58, 'foto5', 1),
(95, 'UT46SD', 'Palanca de repasar', 43, 854, 'foto4', 1),
(96, 'MN87FH', 'Herramienta de pulir', 12, 854, 'foto5', NULL),
(97, 'UT46SD', 'Utensilio para repasar', 67, 45, 'foto3', 2),
(98, 'NE5S78', 'Utensilio de afilar', 12, 45, 'foto5', 2),
(99, '9GJ5T6F', 'Herramienta de pulir', 124, 58, 'foto3', 3),
(100, 'NE5S78', 'Utensilio para repasar', 124, 854, 'foto4', 2),
(101, '098DNF', 'Palanca de repasar', 43, 854, 'foto1', NULL),
(102, 'NE5S78', 'Utensilio para repasar', 67, 123, 'foto2', 2),
(103, '098DNF', 'Utensilio para repasar', 67, 123, 'foto2', 2),
(104, '9GJ5T6F', 'Herramienta de pulir', 12, 89, 'foto1', 2),
(105, 'MN87FH', 'Palanca de repasar', 67, 854, 'foto4', NULL),
(106, '098DNF', 'Utensilio para repasar', 67, 123, 'foto5', 1),
(107, 'MN87FH', 'Palanca de repasar', 124, 45, 'foto5', 3),
(108, 'NE5S78', 'Utensilio para repasar', 12, 45, 'foto3', 3),
(109, 'MN87FH', 'Palanca de repasar', 67, 89, 'foto1', 1),
(110, 'NE5S78', 'Utensilio para repasar', 89, 854, 'foto2', 2),
(111, 'UT46SD', 'Herramienta de pulir', 43, 89, 'foto3', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoproducto`
--

CREATE TABLE `tipoproducto` (
  `id` int(11) NOT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tipoproducto`
--

INSERT INTO `tipoproducto` (`id`, `desc`) VALUES
(1, 'Estandar'),
(2, 'Importado'),
(3, 'Pack');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipousuario`
--

CREATE TABLE `tipousuario` (
  `id` int(11) NOT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tipousuario`
--

INSERT INTO `tipousuario` (`id`, `desc`) VALUES
(1, 'administrador'),
(2, 'cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `dni` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ape1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ape2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pass` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_tipoUsuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `dni`, `nombre`, `ape1`, `ape2`, `login`, `pass`, `id_tipoUsuario`) VALUES
(51, '98741236L', 'Manuela', 'Perez', 'Gonzalez', 'bemu', 'abcde', 2),
(52, '98741236L', ' Lucia', 'Gonzalez', 'Perez', 'mita', '00000', 1),
(53, '96325812H', 'Carlos', 'Marquez', 'Perez', 'mita', 'abcde', 1),
(54, '96325812H', 'Carlos', 'Garcia', 'Martinez', 'pofu', 'qwert', 1),
(55, '96325812H', ' Lucia', 'Garcia', 'Marquez', 'poka', 'qwert', 1),
(56, '98741236L', 'Maria', 'Gonzalez', 'Perez', 'pofu', '00000', 1),
(57, '96325812H', 'Maria', 'Perez', 'Gonzalez', 'pofu', 'aeiou', 1),
(58, '25896321P', 'Carlos', 'Marquez', 'Perez', 'bemu', '00000', 1),
(59, '9654123F', ' Lucia', 'Gonzalez', 'Martinez', 'pofu', 'qwert', 2),
(60, '96325812H', 'Victor', 'Perez', 'Gonzalez', 'bemu', 'aeiou', 1),
(61, '9654123F', 'Carlos', 'Martinez', 'Martinez', 'pofu', 'qwert', 1),
(62, '98741236L', 'Maria', 'Gonzalez', 'Perez', 'poka', 'aeiou', 1),
(63, '75395182R', ' Lucia', 'Martinez', 'Martinez', 'moci', 'abcde', 1),
(64, '98741236L', ' Lucia', 'Martinez', 'Martinez', 'mita', '12345', 1),
(65, '25896321P', 'Manuel', 'Perez', 'Martinez', 'moci', 'qwert', 1),
(66, '75395182R', 'Carlos', 'Garcia', 'Perez', 'moci', 'aeiou', 1),
(67, '25896321P', 'Maria', 'Martinez', 'Gonzalez', 'bemu', 'qwert', 2),
(68, '9654123F', ' Lucia', 'Gonzalez', 'Gonzalez', 'moci', 'abcde', 1),
(69, '25896321P', ' Lucia', 'Gonzalez', 'Gonzalez', 'moci', '12345', 1),
(70, '96325812H', 'Maria', 'Marquez', 'Gonzalez', 'bemu', '00000', 1),
(71, '96325812H', 'Carlos', 'Garcia', 'Gonzalez', 'poka', '12345', 2),
(72, '98741236L', 'Maria', 'Marquez', 'Gonzalez', 'mita', 'qwert', 1),
(73, '9654123F', 'Victor', 'Martinez', 'Perez', 'poka', 'qwert', 1),
(74, '98741236L', 'Victor', 'Gonzalez', 'Garcia', 'moci', 'abcde', 2),
(75, '25896321P', 'Maria', 'Garcia', 'Gonzalez', 'mita', 'qwert', 1),
(76, '25896321P', 'Maria', 'Garcia', 'Gonzalez', 'poka', '12345', 2),
(77, '98741236L', 'Maria', 'Garcia', 'Garcia', 'mita', 'aeiou', 1),
(78, '75395182R', 'Carlos', 'Martinez', 'Martinez', 'pofu', 'abcde', 1),
(79, '25896321P', 'Manuel', 'Martinez', 'Gonzalez', 'poka', 'qwert', 2),
(80, '75395182R', 'Manuel', 'Marquez', 'Martinez', 'bemu', 'aeiou', 1),
(81, '96325812H', 'Maria', 'Gonzalez', 'Gonzalez', 'pofu', 'qwert', 1),
(82, '25896321P', 'Victor', 'Marquez', 'Marquez', 'bemu', 'qwert', 2),
(83, '98741236L', ' Lucia', 'Garcia', 'Perez', 'mita', '00000', 1),
(84, '96325812H', 'Victor', 'Perez', 'Martinez', 'mita', 'abcde', 1),
(85, '75395182R', 'Maria', 'Martinez', 'Perez', 'mita', 'abcde', 2),
(86, '9654123F', 'Victor', 'Martinez', 'Perez', 'poka', 'aeiou', 2),
(87, '98741236L', 'Manuel', 'Marquez', 'Marquez', 'poka', 'qwert', 1),
(88, '96325812H', 'Manuel', 'Marquez', 'Martinez', 'mita', '00000', 1),
(89, '98741236L', 'Maria', 'Perez', 'Martinez', 'pofu', 'aeiou', 2),
(90, '9654123F', 'Manuel', 'Garcia', 'Perez', 'moci', '12345', 2),
(91, '96325812H', 'Manuel', 'Perez', 'Perez', 'mita', '12345', 1),
(92, '25896321P', 'Maria', 'Perez', 'Garcia', 'moci', '00000', 1),
(93, '75395182R', ' Lucia', 'Garcia', 'Martinez', 'poka', 'qwert', 2),
(94, '25896321P', 'Carlos', 'Gonzalez', 'Martinez', 'mita', '00000', 2),
(95, '98741236L', 'Manuel', 'Marquez', 'Marquez', 'pofu', '12345', 2),
(96, '98741236L', 'Carlos', 'Marquez', 'Gonzalez', 'moci', 'aeiou', 2),
(97, '25896321P', ' Lucia', 'Marquez', 'Garcia', 'moci', '00000', 2),
(98, '9654123F', 'Manuel', 'Marquez', 'Gonzalez', 'pofu', 'abcde', 2),
(99, '25896321P', 'Manuel', 'Gonzalez', 'Gonzalez', 'moci', 'qwert', 2),
(100, '98741236L', 'Maria', 'Gonzalez', 'Perez', 'bemu', '12345', 2),
(101, '98741236L', 'Maria', 'Garcia', 'Marquez', 'poka', 'qwert', 2),
(102, '75395182R', 'Carlos', 'Perez', 'Martinez', 'moci', '12345', 1),
(103, '98741236L', 'Maria', 'Marquez', 'Gonzalez', 'bemu', '00000', 2),
(104, '75395182R', 'Maria', 'Marquez', 'Gonzalez', 'bemu', '12345', 2),
(105, '9654123F', 'Carlos', 'Gonzalez', 'Marquez', 'bemu', '12345', 2),
(106, '9654123F', 'Carlos', 'Perez', 'Marquez', 'mita', 'abcde', 2),
(107, '98741236L', 'Manuel', 'Marquez', 'Garcia', 'poka', '12345', 2),
(108, '98741236L', 'Manuel', 'Perez', 'Perez', 'moci', '12345', 1),
(109, '9654123F', 'Carlos', 'Marquez', 'Gonzalez', 'mita', 'qwert', 1),
(110, '98741236L', ' Lucia', 'Marquez', 'Perez', 'mita', '12345', 1),
(111, '98741236L', 'Victor', 'Martinez', 'Garcia', 'mita', '00000', 2),
(112, '98741236L', ' Lucia', 'Martinez', 'Gonzalez', 'pofu', '00000', 1),
(113, '96325812H', 'Manuel', 'Gonzalez', 'Marquez', 'pofu', 'qwert', 2),
(114, '96325812H', 'Maria', 'Martinez', 'Perez', 'poka', '00000', 2),
(115, '9654123F', ' Lucia', 'Garcia', 'Perez', 'mita', '00000', 1),
(116, '98741236L', 'Manuel', 'Garcia', 'Perez', 'mita', 'aeiou', 1),
(117, '98741236L', ' Lucia', 'Gonzalez', 'Marquez', 'moci', 'qwert', 1),
(118, '25896321P', 'Maria', 'Perez', 'Garcia', 'bemu', 'qwert', 1),
(119, '96325812H', 'Victor', 'Martinez', 'Garcia', 'pofu', '00000', 2),
(120, '98741236L', ' Lucia', 'Perez', 'Martinez', 'mita', 'qwert', 2),
(121, '75395182R', ' Lucia', 'Marquez', 'Marquez', 'poka', 'qwert', 2),
(122, '9654123F', 'Victor', 'Gonzalez', 'Perez', 'mita', '00000', 2),
(123, '96325812H', 'Manuel', 'Garcia', 'Garcia', 'mita', 'aeiou', 1),
(124, '98741236L', 'Victor', 'Perez', 'Martinez', 'pofu', 'abcde', 2),
(125, '9654123F', ' Lucia', 'Perez', 'Gonzalez', 'poka', '12345', 2),
(126, '9654123F', ' Lucia', 'Marquez', 'Garcia', 'bemu', 'qwert', 1),
(127, '9654123F', 'Maria', 'Gonzalez', 'Perez', 'moci', '12345', 1),
(128, '75395182R', 'Manuel', 'Gonzalez', 'Perez', 'pofu', 'qwert', 2),
(129, '25896321P', 'Manuel', 'Perez', 'Marquez', 'pofu', 'abcde', 2),
(130, '9654123F', 'Carlos', 'Perez', 'Marquez', 'poka', 'qwert', 1),
(131, '98741236L', ' Lucia', 'Marquez', 'Perez', 'pofu', 'aeiou', 2),
(132, '25896321P', 'Manuel', 'Perez', 'Marquez', 'bemu', '00000', 1),
(133, '75395182R', 'Manuel', 'Martinez', 'Gonzalez', 'moci', 'qwert', 1),
(134, '75395182R', 'Carlos', 'Gonzalez', 'Gonzalez', 'mita', '00000', 1),
(135, '25896321P', 'Maria', 'Gonzalez', 'Marquez', 'pofu', 'qwert', 2),
(136, '9654123F', 'Maria', 'Marquez', 'Martinez', 'moci', 'aeiou', 1),
(137, '96325812H', 'Maria', 'Martinez', 'Perez', 'poka', 'aeiou', 2),
(138, '25896321P', ' Lucia', 'Marquez', 'Gonzalez', 'poka', 'aeiou', 1),
(139, '98741236L', 'Carlos', 'Marquez', 'Marquez', 'mita', '00000', 2),
(140, '9654123F', ' Lucia', 'Martinez', 'Gonzalez', 'poka', 'abcde', 2),
(141, '98741236L', 'Carlos', 'Garcia', 'Perez', 'bemu', '00000', 2),
(142, '25896321P', 'Maria', 'Garcia', 'Martinez', 'mita', '12345', 2),
(143, '25896321P', 'Manuel', 'Garcia', 'Marquez', 'moci', 'abcde', 1),
(144, '75395182R', 'Manuel', 'Perez', 'Garcia', 'mita', '12345', 1),
(145, '25896321P', 'Maria', 'Garcia', 'Martinez', 'bemu', '12345', 2),
(146, '75395182R', 'Manuel', 'Martinez', 'Martinez', 'poka', 'abcde', 1),
(147, '98741236L', 'Victor', 'Garcia', 'Garcia', 'mita', '12345', 1),
(148, '75395182R', 'Carlos', 'Perez', 'Perez', 'pofu', '12345', 2),
(149, '25896321P', 'Victor', 'Marquez', 'Garcia', 'pofu', '12345', 2),
(150, '9654123F', 'Victor', 'Garcia', 'Perez', 'bemu', 'aeiou', 2),
(151, '9654123F', 'Manuel', 'Garcia', 'Marquez', 'pofu', '00000', 1),
(152, '75395182R', 'Maria', 'Marquez', 'Martinez', 'poka', 'qwert', 1),
(153, '9654123F', 'Carlos', 'Garcia', 'Gonzalez', 'pofu', '12345', 1),
(154, '96325812H', 'Victor', 'Perez', 'Gonzalez', 'bemu', 'qwert', 2),
(155, '25896321P', ' Lucia', 'Perez', 'Martinez', 'moci', 'qwert', 2),
(156, '25896321P', ' Lucia', 'Marquez', 'Marquez', 'bemu', '00000', 1),
(157, '9654123F', 'Manuel', 'Perez', 'Garcia', 'bemu', 'aeiou', 2),
(158, '9654123F', 'Manuel', 'Marquez', 'Gonzalez', 'poka', 'aeiou', 1),
(159, '9654123F', 'Victor', 'Perez', 'Gonzalez', 'moci', '12345', 1),
(160, '98741236L', 'Maria', 'Martinez', 'Gonzalez', 'mita', '12345', 2),
(161, '96325812H', 'Maria', 'Martinez', 'Martinez', 'bemu', 'qwert', 1),
(162, '98741236L', 'Victor', 'Perez', 'Marquez', 'bemu', 'aeiou', 2),
(163, '75395182R', 'Maria', 'Garcia', 'Gonzalez', 'pofu', '12345', 1),
(164, '75395182R', 'Carlos', 'Garcia', 'Garcia', 'moci', 'qwert', 1),
(165, '96325812H', ' Lucia', 'Perez', 'Perez', 'mita', '00000', 1),
(166, '96325812H', 'Victor', 'Perez', 'Gonzalez', 'pofu', 'abcde', 1),
(167, '98741236L', 'Victor', 'Garcia', 'Gonzalez', 'bemu', '00000', 1),
(168, '96325812H', 'Manuel', 'Garcia', 'Garcia', 'moci', 'abcde', 1),
(169, '25896321P', 'Manuel', 'Gonzalez', 'Perez', 'bemu', '12345', 2),
(170, '98741236L', 'Manuel', 'Martinez', 'Garcia', 'bemu', '12345', 1),
(171, '25896321P', 'Victor', 'Marquez', 'Martinez', 'moci', 'abcde', 1),
(172, '25896321P', 'Maria', 'Gonzalez', 'Marquez', 'pofu', 'aeiou', 2),
(173, '98741236L', 'Carlos', 'Garcia', 'Marquez', 'mita', 'aeiou', 2),
(174, '75395182R', ' Lucia', 'Martinez', 'Perez', 'moci', 'aeiou', 1),
(175, '98741236L', 'Maria', 'Perez', 'Perez', 'bemu', 'aeiou', 1),
(176, '96325812H', 'Manuel', 'Martinez', 'Garcia', 'poka', 'abcde', 2),
(177, '75395182R', 'Manuel', 'Gonzalez', 'Martinez', 'mita', 'aeiou', 2),
(178, '9654123F', 'Maria', 'Gonzalez', 'Martinez', 'mita', 'qwert', 1),
(179, '98741236L', 'Maria', 'Gonzalez', 'Garcia', 'mita', 'aeiou', 2),
(180, '75395182R', 'Manuel', 'Martinez', 'Martinez', 'bemu', '12345', 1),
(181, '9654123F', 'Maria', 'Perez', 'Garcia', 'moci', 'abcde', 1),
(182, '96325812H', 'Maria', 'Gonzalez', 'Garcia', 'poka', '12345', 1),
(183, '98741236L', 'Carlos', 'Perez', 'Martinez', 'poka', '00000', 2),
(184, '75395182R', 'Carlos', 'Gonzalez', 'Martinez', 'poka', '12345', 1),
(185, '25896321P', 'Victor', 'Martinez', 'Perez', 'bemu', '12345', 1),
(186, '75395182R', 'Manuel', 'Perez', 'Garcia', 'bemu', 'qwert', 2),
(187, '25896321P', 'Carlos', 'Gonzalez', 'Marquez', 'moci', 'aeiou', 2),
(188, '96325812H', ' Lucia', 'Gonzalez', 'Perez', 'moci', '00000', 2),
(189, '75395182R', 'Victor', 'Perez', 'Gonzalez', 'mita', 'abcde', 2),
(190, '25896321P', 'Maria', 'Gonzalez', 'Marquez', 'poka', 'aeiou', 1),
(191, '25896321P', 'Victor', 'Perez', 'Martinez', 'poka', 'aeiou', 2),
(192, '9654123F', 'Maria', 'Martinez', 'Marquez', 'pofu', 'abcde', 2),
(193, '25896321P', 'Carlos', 'Gonzalez', 'Martinez', 'moci', 'qwert', 2),
(194, '75395182R', 'Maria', 'Martinez', 'Perez', 'poka', 'abcde', 2),
(195, '98741236L', 'Carlos', 'Marquez', 'Marquez', 'bemu', 'qwert', 1),
(196, '96325812H', 'Manuel', 'Gonzalez', 'Gonzalez', 'moci', 'abcde', 2),
(197, '25896321P', ' Lucia', 'Martinez', 'Marquez', 'mita', '12345', 1),
(198, '25896321P', 'Manuel', 'Marquez', 'Marquez', 'pofu', 'aeiou', 2),
(199, '25896321P', ' Lucia', 'Marquez', 'Perez', 'pofu', 'qwert', 2),
(200, '98741236L', 'Victor', 'Marquez', 'Gonzalez', 'bemu', 'abcde', 2),
(201, '98741236L', 'Maria', 'Martinez', 'Garcia', 'pofu', 'abcde', 2),
(202, '9654123F', 'Carlos', 'Martinez', 'Martinez', 'moci', '12345', 2),
(203, '96325812H', 'Carlos', 'Martinez', 'Garcia', 'pofu', '00000', 1),
(204, '96325812H', 'Manuel', 'Perez', 'Martinez', 'moci', '00000', 2),
(205, '75395182R', 'Carlos', 'Perez', 'Garcia', 'mita', 'abcde', 1),
(206, '98741236L', 'Carlos', 'Martinez', 'Martinez', 'bemu', '12345', 2),
(207, '25896321P', 'Victor', 'Gonzalez', 'Martinez', 'pofu', 'abcde', 1),
(208, '98741236L', 'Manuel', 'Gonzalez', 'Marquez', 'bemu', '00000', 2),
(209, '96325812H', 'Carlos', 'Martinez', 'Perez', 'moci', 'qwert', 1),
(210, '75395182R', 'Maria', 'Perez', 'Marquez', 'bemu', 'qwert', 1),
(211, '9654123F', 'Maria', 'Marquez', 'Marquez', 'pofu', '00000', 2),
(212, '98741236L', 'Manuel', 'Gonzalez', 'Gonzalez', 'pofu', 'qwert', 1),
(213, '9654123F', 'Victor', 'Perez', 'Martinez', 'pofu', 'qwert', 2),
(214, '9654123F', ' Lucia', 'Gonzalez', 'Gonzalez', 'bemu', '00000', 2),
(215, '9654123F', ' Lucia', 'Garcia', 'Perez', 'pofu', 'qwert', 2),
(216, '96325812H', 'Manuel', 'Marquez', 'Perez', 'poka', '00000', 1),
(217, '96325812H', 'Maria', 'Marquez', 'Martinez', 'mita', 'aeiou', 2),
(218, '9654123F', 'Maria', 'Marquez', 'Perez', 'poka', '12345', 1),
(219, '98741236L', 'Manuel', 'Perez', 'Perez', 'bemu', 'qwert', 1),
(220, '9654123F', 'Carlos', 'Perez', 'Martinez', 'bemu', '12345', 1),
(221, '75395182R', 'Maria', 'Gonzalez', 'Gonzalez', 'bemu', '00000', 2),
(222, '98741236L', 'Maria', 'Martinez', 'Perez', 'pofu', 'aeiou', 2),
(223, '98741236L', 'Victor', 'Garcia', 'Gonzalez', 'bemu', '00000', 2),
(224, '25896321P', ' Lucia', 'Martinez', 'Gonzalez', 'mita', '12345', 1),
(225, '9654123F', 'Maria', 'Marquez', 'Marquez', 'pofu', 'qwert', 1),
(226, '96325812H', 'Maria', 'Gonzalez', 'Perez', 'pofu', 'qwert', 1),
(227, '25896321P', 'Victor', 'Garcia', 'Perez', 'mita', '00000', 2),
(228, '25896321P', 'Victor', 'Perez', 'Perez', 'pofu', 'abcde', 2),
(229, '98741236L', 'Manuel', 'Martinez', 'Martinez', 'poka', 'abcde', 1),
(230, '75395182R', 'Victor', 'Gonzalez', 'Perez', 'bemu', 'abcde', 2),
(231, '25896321P', 'Victor', 'Garcia', 'Gonzalez', 'poka', 'abcde', 1),
(232, '25896321P', 'Carlos', 'Marquez', 'Martinez', 'moci', '00000', 2),
(233, '75395182R', 'Carlos', 'Garcia', 'Perez', 'moci', 'aeiou', 1),
(234, '96325812H', 'Maria', 'Garcia', 'Garcia', 'mita', 'aeiou', 2),
(235, '96325812H', 'Carlos', 'Perez', 'Martinez', 'mita', '12345', 1),
(236, '75395182R', 'Carlos', 'Marquez', 'Garcia', 'mita', '12345', 2),
(237, '9654123F', 'Carlos', 'Perez', 'Martinez', 'mita', 'abcde', 1),
(238, '25896321P', 'Victor', 'Gonzalez', 'Gonzalez', 'poka', 'qwert', 2),
(239, '96325812H', 'Manuel', 'Gonzalez', 'Perez', 'pofu', 'abcde', 2),
(240, '9654123F', ' Lucia', 'Marquez', 'Garcia', 'poka', '00000', 2),
(241, '96325812H', 'Carlos', 'Gonzalez', 'Martinez', 'bemu', 'qwert', 1),
(242, '9654123F', 'Victor', 'Martinez', 'Perez', 'moci', '00000', 2),
(243, '75395182R', 'Carlos', 'Perez', 'Martinez', 'bemu', 'qwert', 1),
(244, '75395182R', 'Maria', 'Marquez', 'Marquez', 'mita', 'abcde', 1),
(245, '75395182R', 'Victor', 'Garcia', 'Marquez', 'mita', 'abcde', 2),
(246, '96325812H', ' Lucia', 'Perez', 'Gonzalez', 'poka', '00000', 2),
(247, '96325812H', 'Victor', 'Perez', 'Marquez', 'moci', 'qwert', 1),
(248, '96325812H', 'Victor', 'Garcia', 'Garcia', 'pofu', 'abcde', 2),
(249, '98741236L', 'Manuel', 'Perez', 'Garcia', 'bemu', '00000', 2),
(250, '98741236L', 'Manuel', 'Gonzalez', 'Martinez', 'moci', 'aeiou', 2),
(251, '75395182R', 'Carlos', 'Marquez', 'Perez', 'poka', '00000', 1),
(252, '98741236L', 'Carlos', 'Gonzalez', 'Gonzalez', 'bemu', '12345', 1),
(253, '9654123F', ' Lucia', 'Garcia', 'Martinez', 'poka', 'abcde', 1),
(254, '98741236L', ' Lucia', 'Marquez', 'Perez', 'pofu', 'aeiou', 2),
(255, '75395182R', ' Lucia', 'Perez', 'Martinez', 'mita', 'qwert', 2),
(256, '9654123F', 'Victor', 'Marquez', 'Martinez', 'mita', 'qwert', 2),
(257, '25896321P', ' Lucia', 'Garcia', 'Garcia', 'pofu', '00000', 1),
(258, '9654123F', 'Manuel', 'Marquez', 'Garcia', 'pofu', 'abcde', 1),
(259, '96325812H', 'Maria', 'Marquez', 'Martinez', 'mita', '12345', 2),
(260, '96325812H', 'Carlos', 'Garcia', 'Martinez', 'bemu', '12345', 2),
(261, '98741236L', 'Maria', 'Garcia', 'Gonzalez', 'poka', 'aeiou', 1),
(262, '9654123F', 'Manuel', 'Garcia', 'Perez', 'mita', 'aeiou', 2),
(263, '9654123F', 'Carlos', 'Gonzalez', 'Perez', 'moci', 'qwert', 1),
(264, '98741236L', ' Lucia', 'Gonzalez', 'Perez', 'pofu', 'aeiou', 1),
(265, '25896321P', 'Maria', 'Martinez', 'Garcia', 'moci', 'abcde', 1),
(266, '9654123F', 'Manuel', 'Martinez', 'Perez', 'mita', 'aeiou', 1),
(267, '75395182R', 'Victor', 'Perez', 'Martinez', 'mita', '00000', 2),
(268, '98741236L', 'Victor', 'Marquez', 'Martinez', 'bemu', 'abcde', 2),
(269, '9654123F', ' Lucia', 'Marquez', 'Martinez', 'poka', 'abcde', 1),
(270, '9654123F', 'Victor', 'Perez', 'Garcia', 'pofu', '12345', 1),
(271, '96325812H', 'Victor', 'Perez', 'Perez', 'mita', '12345', 2),
(272, '96325812H', 'Carlos', 'Garcia', 'Garcia', 'pofu', '00000', 1),
(273, '75395182R', ' Lucia', 'Perez', 'Perez', 'pofu', 'aeiou', 2),
(274, '25896321P', 'Maria', 'Garcia', 'Marquez', 'pofu', 'qwert', 2),
(275, '25896321P', 'Carlos', 'Garcia', 'Marquez', 'mita', '00000', 2),
(276, '75395182R', ' Lucia', 'Perez', 'Martinez', 'moci', 'qwert', 2),
(277, '98741236L', ' Lucia', 'Marquez', 'Martinez', 'moci', '00000', 2),
(278, '9654123F', 'Maria', 'Martinez', 'Perez', 'mita', 'qwert', 1),
(279, '25896321P', 'Carlos', 'Marquez', 'Gonzalez', 'mita', 'abcde', 2),
(280, '98741236L', ' Lucia', 'Martinez', 'Martinez', 'mita', 'aeiou', 1),
(281, '9654123F', 'Maria', 'Gonzalez', 'Martinez', 'moci', 'aeiou', 1),
(282, '9654123F', 'Carlos', 'Marquez', 'Marquez', 'mita', '12345', 2),
(283, '96325812H', 'Carlos', 'Gonzalez', 'Gonzalez', 'pofu', 'abcde', 1),
(284, '98741236L', 'Carlos', 'Gonzalez', 'Marquez', 'moci', 'qwert', 1),
(285, '75395182R', 'Victor', 'Gonzalez', 'Gonzalez', 'bemu', '12345', 2),
(286, '25896321P', 'Maria', 'Marquez', 'Marquez', 'bemu', '12345', 1),
(287, '96325812H', 'Carlos', 'Marquez', 'Marquez', 'moci', 'qwert', 2),
(288, '98741236L', 'Carlos', 'Garcia', 'Marquez', 'moci', 'aeiou', 1),
(289, '98741236L', 'Victor', 'Gonzalez', 'Martinez', 'bemu', 'aeiou', 2),
(290, '25896321P', 'Victor', 'Marquez', 'Gonzalez', 'pofu', 'qwert', 2),
(291, '96325812H', 'Carlos', 'Martinez', 'Martinez', 'moci', 'aeiou', 1),
(292, '96325812H', 'Manuel', 'Marquez', 'Marquez', 'poka', '12345', 2),
(293, '25896321P', 'Manuel', 'Garcia', 'Martinez', 'moci', 'aeiou', 1),
(294, '98741236L', 'Victor', 'Martinez', 'Perez', 'moci', 'abcde', 1),
(295, '9654123F', ' Lucia', 'Martinez', 'Perez', 'poka', '12345', 2),
(296, '98741236L', 'Manuel', 'Marquez', 'Garcia', 'bemu', '12345', 2),
(297, '75395182R', 'Manuel', 'Perez', 'Marquez', 'pofu', 'abcde', 2),
(298, '9654123F', 'Carlos', 'Marquez', 'Martinez', 'moci', 'qwert', 1),
(299, '98741236L', 'Maria', 'Gonzalez', 'Martinez', 'pofu', '00000', 1),
(300, '75395182R', 'Maria', 'Garcia', 'Marquez', 'pofu', '12345', 1),
(301, '98741236L', ' Lucia', 'Gonzalez', 'Gonzalez', 'poka', '12345', 1),
(302, '98741236L', 'Maria', 'Perez', 'Marquez', 'bemu', 'aeiou', 2),
(303, '75395182R', ' Lucia', 'Garcia', 'Perez', 'mita', 'qwert', 1),
(304, '25896321P', ' Lucia', 'Gonzalez', 'Marquez', 'moci', 'qwert', 1),
(305, '75395182R', ' Lucia', 'Gonzalez', 'Martinez', 'bemu', '12345', 2),
(306, '75395182R', 'Victor', 'Marquez', 'Marquez', 'poka', 'aeiou', 2),
(307, '9654123F', 'Manuel', 'Martinez', 'Perez', 'bemu', '00000', 2),
(308, '96325812H', 'Victor', 'Garcia', 'Martinez', 'moci', '12345', 2),
(309, '9654123F', 'Manuel', 'Garcia', 'Martinez', 'moci', '12345', 2),
(310, '96325812H', 'Victor', 'Martinez', 'Marquez', 'poka', '00000', 1),
(311, '96325812H', 'Maria', 'Gonzalez', 'Martinez', 'poka', 'qwert', 1),
(312, '25896321P', 'Manuel', 'Martinez', 'Gonzalez', 'moci', 'qwert', 2),
(313, '75395182R', 'Manuel', 'Martinez', 'Gonzalez', 'poka', '00000', 2),
(314, '75395182R', 'Manuel', 'Marquez', 'Martinez', 'pofu', '00000', 2),
(315, '96325812H', 'Carlos', 'Garcia', 'Martinez', 'poka', 'abcde', 1),
(316, '98741236L', 'Maria', 'Perez', 'Martinez', 'mita', '12345', 2),
(317, '96325812H', ' Lucia', 'Gonzalez', 'Marquez', 'moci', '00000', 2),
(318, '96325812H', 'Carlos', 'Gonzalez', 'Perez', 'bemu', 'abcde', 1),
(319, '96325812H', 'Maria', 'Martinez', 'Garcia', 'pofu', 'aeiou', 1),
(320, '75395182R', ' Lucia', 'Garcia', 'Marquez', 'mita', 'aeiou', 1),
(321, '9654123F', 'Manuel', 'Perez', 'Martinez', 'pofu', '00000', 1),
(322, '96325812H', ' Lucia', 'Martinez', 'Garcia', 'mita', 'abcde', 2),
(323, '75395182R', 'Carlos', 'Martinez', 'Martinez', 'moci', 'aeiou', 1),
(324, '96325812H', 'Manuel', 'Martinez', 'Marquez', 'moci', 'aeiou', 1),
(325, '9654123F', ' Lucia', 'Perez', 'Perez', 'pofu', 'aeiou', 1),
(326, '25896321P', 'Manuel', 'Perez', 'Martinez', 'poka', 'qwert', 2),
(327, '25896321P', 'Maria', 'Garcia', 'Martinez', 'bemu', 'aeiou', 2),
(328, '9654123F', 'Carlos', 'Perez', 'Gonzalez', 'mita', 'qwert', 2),
(329, '96325812H', 'Maria', 'Gonzalez', 'Garcia', 'moci', 'qwert', 2),
(330, '96325812H', 'Victor', 'Perez', 'Garcia', 'bemu', '12345', 1),
(331, '98741236L', 'Maria', 'Gonzalez', 'Martinez', 'bemu', 'abcde', 1),
(333, '75395182R', ' Lucia', 'Martinez', 'Garcia', 'poka', 'qwert', 1),
(334, '96325812H', ' Lucia', 'Garcia', 'Garcia', 'pofu', 'aeiou', 2),
(335, '75395182R', 'Victor', 'Perez', 'Marquez', 'moci', '00000', 1),
(336, '75395182R', 'Manuel', 'Martinez', 'Marquez', 'poka', '12345', 1),
(337, '98741236L', 'Maria', 'Gonzalez', 'Gonzalez', 'bemu', 'abcde', 1),
(338, '96325812H', 'Carlos', 'Martinez', 'Gonzalez', 'poka', '00000', 2),
(339, '25896321P', 'Manuel', 'Martinez', 'Marquez', 'poka', '12345', 1),
(340, '75395182R', 'Maria', 'Garcia', 'Perez', 'poka', '00000', 1),
(341, '02587412J', 'pepe', 'perez', 'perez', 'pepin', '123456', 2),
(342, '25896321L', 'pepe', 'perez', 'gimenez', 'pep', '123456', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_factura_usuario1_idx` (`id_usuario`);

--
-- Indices de la tabla `linea`
--
ALTER TABLE `linea`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_linea_producto1_idx` (`id_producto`),
  ADD KEY `fk_linea_factura1_idx` (`id_factura`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_producto_tipoProducto1_idx` (`id_tipoProducto`);

--
-- Indices de la tabla `tipoproducto`
--
ALTER TABLE `tipoproducto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_usuario_tipoUsuario_idx` (`id_tipoUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `linea`
--
ALTER TABLE `linea`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT de la tabla `tipoproducto`
--
ALTER TABLE `tipoproducto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=343;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `fk_factura_usuario1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `linea`
--
ALTER TABLE `linea`
  ADD CONSTRAINT `fk_linea_factura1` FOREIGN KEY (`id_factura`) REFERENCES `factura` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_linea_producto1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_producto_tipoProducto1` FOREIGN KEY (`id_tipoProducto`) REFERENCES `tipoproducto` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_tipoUsuario` FOREIGN KEY (`id_tipoUsuario`) REFERENCES `tipousuario` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
