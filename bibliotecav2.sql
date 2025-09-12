-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 12, 2025 at 07:14 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bibliotecav2`
--

-- --------------------------------------------------------

--
-- Table structure for table `area_tematica`
--

CREATE TABLE `area_tematica` (
  `id_area_tematica` int(11) NOT NULL,
  `nombre_area` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `area_tematica`
--

INSERT INTO `area_tematica` (`id_area_tematica`, `nombre_area`) VALUES
(1, 'comedia');

-- --------------------------------------------------------

--
-- Table structure for table `autor`
--

CREATE TABLE `autor` (
  `id_autor` int(11) NOT NULL,
  `nombre_autor` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `autor`
--

INSERT INTO `autor` (`id_autor`, `nombre_autor`) VALUES
(1, 'pandora actor');

-- --------------------------------------------------------

--
-- Table structure for table `baja`
--

CREATE TABLE `baja` (
  `id_baja` int(11) NOT NULL,
  `id_libro` int(11) NOT NULL,
  `motivo` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fecha_baja` date NOT NULL,
  `acta_generada` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `devolucion`
--

CREATE TABLE `devolucion` (
  `id_devolucion` int(11) NOT NULL,
  `id_prestamo` int(11) NOT NULL,
  `fecha_devolucion_real` date NOT NULL,
  `observaciones_estado_fisico` text CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `devolucion`
--

INSERT INTO `devolucion` (`id_devolucion`, `id_prestamo`, `fecha_devolucion_real`, `observaciones_estado_fisico`) VALUES
(1, 1, '2025-09-04', 'en buen estado');

-- --------------------------------------------------------

--
-- Table structure for table `editorial`
--

CREATE TABLE `editorial` (
  `id_editorial` int(11) NOT NULL,
  `nombre_editorial` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `editorial`
--

INSERT INTO `editorial` (`id_editorial`, `nombre_editorial`) VALUES
(1, 'Pandora\'s');

-- --------------------------------------------------------

--
-- Table structure for table `libro`
--

CREATE TABLE `libro` (
  `id_libro` int(11) NOT NULL,
  `titulo` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `id_editorial` int(11) NOT NULL,
  `ano_publicacion` year(4) NOT NULL,
  `edicion` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `ISBN` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `codigo_clasificacion` int(11) DEFAULT NULL,
  `id_area_tematica` int(11) NOT NULL,
  `numero_inventario` int(11) NOT NULL,
  `estado` enum('disponible','dañado','baja') CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `observaciones` text CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `libro`
--

INSERT INTO `libro` (`id_libro`, `titulo`, `id_editorial`, `ano_publicacion`, `edicion`, `ISBN`, `codigo_clasificacion`, `id_area_tematica`, `numero_inventario`, `estado`, `observaciones`) VALUES
(1, 'La Rosa de Guadalupe', 1, '2008', '1ra', '0-7103-7642-1', 0, 1, 1001, 'disponible', '');

-- --------------------------------------------------------

--
-- Table structure for table `libro_autor`
--

CREATE TABLE `libro_autor` (
  `id_libro` int(11) NOT NULL,
  `id_autor` int(11) NOT NULL,
  `id_compuesta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `libro_autor`
--

INSERT INTO `libro_autor` (`id_libro`, `id_autor`, `id_compuesta`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `prestamo`
--

CREATE TABLE `prestamo` (
  `id_prestamo` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_libro` int(11) NOT NULL,
  `fecha_prestamo` date NOT NULL,
  `fecha_devolucion_estimada` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `prestamo`
--

INSERT INTO `prestamo` (`id_prestamo`, `id_usuario`, `id_libro`, `fecha_prestamo`, `fecha_devolucion_estimada`) VALUES
(1, 1, 1, '2025-09-03', '2025-09-17');

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre_completo` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `tipo_usuario` enum('estudiante','docente') CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `dni_o_matricula` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre_completo`, `tipo_usuario`, `dni_o_matricula`) VALUES
(1, 'sam', 'estudiante', 47830193);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `area_tematica`
--
ALTER TABLE `area_tematica`
  ADD PRIMARY KEY (`id_area_tematica`);

--
-- Indexes for table `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`id_autor`);

--
-- Indexes for table `baja`
--
ALTER TABLE `baja`
  ADD PRIMARY KEY (`id_baja`),
  ADD KEY `FK id_libro2` (`id_libro`);

--
-- Indexes for table `devolucion`
--
ALTER TABLE `devolucion`
  ADD PRIMARY KEY (`id_devolucion`),
  ADD KEY `FK_D_id_prestamo` (`id_prestamo`);

--
-- Indexes for table `editorial`
--
ALTER TABLE `editorial`
  ADD PRIMARY KEY (`id_editorial`);

--
-- Indexes for table `libro`
--
ALTER TABLE `libro`
  ADD PRIMARY KEY (`id_libro`),
  ADD KEY `FK id_editorial` (`id_editorial`),
  ADD KEY `FK id_area_tematica` (`id_area_tematica`);

--
-- Indexes for table `libro_autor`
--
ALTER TABLE `libro_autor`
  ADD PRIMARY KEY (`id_compuesta`),
  ADD KEY `FK id_libro` (`id_libro`),
  ADD KEY `FK id_autor` (`id_autor`);

--
-- Indexes for table `prestamo`
--
ALTER TABLE `prestamo`
  ADD PRIMARY KEY (`id_prestamo`),
  ADD KEY `FK_P_id_usuario` (`id_usuario`),
  ADD KEY `FK_P_id_libro` (`id_libro`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `area_tematica`
--
ALTER TABLE `area_tematica`
  MODIFY `id_area_tematica` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `autor`
--
ALTER TABLE `autor`
  MODIFY `id_autor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `baja`
--
ALTER TABLE `baja`
  MODIFY `id_baja` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `devolucion`
--
ALTER TABLE `devolucion`
  MODIFY `id_devolucion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `editorial`
--
ALTER TABLE `editorial`
  MODIFY `id_editorial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `libro`
--
ALTER TABLE `libro`
  MODIFY `id_libro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `libro_autor`
--
ALTER TABLE `libro_autor`
  MODIFY `id_compuesta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `prestamo`
--
ALTER TABLE `prestamo`
  MODIFY `id_prestamo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `baja`
--
ALTER TABLE `baja`
  ADD CONSTRAINT `FK id_libro2` FOREIGN KEY (`id_libro`) REFERENCES `libro` (`id_libro`);

--
-- Constraints for table `devolucion`
--
ALTER TABLE `devolucion`
  ADD CONSTRAINT `FK_D_id_prestamo` FOREIGN KEY (`id_prestamo`) REFERENCES `prestamo` (`id_prestamo`);

--
-- Constraints for table `libro`
--
ALTER TABLE `libro`
  ADD CONSTRAINT `FK id_area_tematica` FOREIGN KEY (`id_area_tematica`) REFERENCES `area_tematica` (`id_area_tematica`),
  ADD CONSTRAINT `FK id_editorial` FOREIGN KEY (`id_editorial`) REFERENCES `editorial` (`id_editorial`);

--
-- Constraints for table `libro_autor`
--
ALTER TABLE `libro_autor`
  ADD CONSTRAINT `FK id_autor` FOREIGN KEY (`id_autor`) REFERENCES `autor` (`id_autor`),
  ADD CONSTRAINT `FK id_libro` FOREIGN KEY (`id_libro`) REFERENCES `libro` (`id_libro`);

--
-- Constraints for table `prestamo`
--
ALTER TABLE `prestamo`
  ADD CONSTRAINT `FK_P_id_libro` FOREIGN KEY (`id_libro`) REFERENCES `libro` (`id_libro`),
  ADD CONSTRAINT `FK_P_id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
