-- 1. CREAR Y SELECCIONAR LA BASE DE DATOS
-- Asegúrate de que el nombre sea 'proyecto_web_final' (coincide con database.php)
CREATE DATABASE IF NOT EXISTS proyecto_web_final
CHARACTER SET utf8mb4
COLLATE utf8mb4_general_ci;

USE proyecto_web_final;

-- ---------------------------------------------
-- 2. TABLA PARA EL CATÁLOGO DE PRODUCTOS (Herramientas IA)
-- Usada por agregar.php, editar.php, eliminar.php
-- ---------------------------------------------
CREATE TABLE IF NOT EXISTS productos (
    id INT(11) NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    imagen VARCHAR(255) DEFAULT NULL,
    categoria VARCHAR(100) NOT NULL,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ---------------------------------------------
-- 3. TABLA PARA EL REGISTRO DE ALUMNOS
-- Usada por procesar_alumnos.php
-- ---------------------------------------------
CREATE TABLE IF NOT EXISTS alumnos (
    id INT(11) NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    carrera VARCHAR(100) NOT NULL,
    semestre VARCHAR(50) NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ---------------------------------------------
-- 4. TABLA PARA EL FORMULARIO DE CONTACTO
-- Usada por procesar_contacto.php
-- ---------------------------------------------
CREATE TABLE IF NOT EXISTS contacto (
    id INT(11) NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(150) NOT NULL,
    email VARCHAR(150) NOT NULL,
    mensaje TEXT NOT NULL,
    fecha_envio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ---------------------------------------------
-- 5. TABLA PARA EL REGISTRO DE COMPRAS (SOLICITUDES DE PLAN)
-- Usada por procesar_compra.php
-- ---------------------------------------------
CREATE TABLE IF NOT EXISTS compras (
    id INT(11) NOT NULL AUTO_INCREMENT,
    id_producto VARCHAR(50) NOT NULL, -- Soporta IDs manuales (manual_1) y IDs de la DB
    nombre_cliente VARCHAR(150) NOT NULL,
    email_cliente VARCHAR(150) NOT NULL,
    cantidad INT(11) DEFAULT 1,
    total DECIMAL(10, 2) NOT NULL,
    fecha_compra TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ---------------------------------------------
-- 6. TABLA PARA EL INICIO DE SESIÓN DE ADMINISTRADORES
-- Usada por loging.php
-- ---------------------------------------------
CREATE TABLE IF NOT EXISTS usuarios (
    id INT(11) NOT NULL AUTO_INCREMENT,
    usuario VARCHAR(50) NOT NULL UNIQUE,
    password CHAR(32) NOT NULL, -- Almacena el hash MD5
    rol ENUM('admin', 'usuario') NOT NULL DEFAULT 'usuario',
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ---------------------------------------------
-- 7. INSERTAR UN USUARIO ADMINISTRADOR DE PRUEBA
-- Usuario: admin | Contraseña: admin123 (Hash MD5)
-- ---------------------------------------------
INSERT INTO usuarios (usuario, password, rol) VALUES
('admin', '21232f297a57a5a743894a0e4a801fc3', 'admin');