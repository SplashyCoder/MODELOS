DROP DATABASE IF EXISTS CINE_JUNGLA;
CREATE DATABASE CINE_JUNGLA CHARACTER SET utf8mb4;
USE CINE_JUNGLA;
    
CREATE TABLE IF NOT EXISTS clientes( 
    id_cliente UUID DEFAULT gen_random_uuid() NOT NULL PRIMARY KEY,
    nombre VARCHAR(60) NOT NULL,
    apellido  VARCHAR(60) NOT NULL,
    usuario  VARCHAR(60) NOT NULL,
    contra VARCHAR(60) NOT NULL,
    puntos INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS comida(
    id_comida UUID DEFAULT gen_random_uuid() NOT NULL PRIMARY KEY,
    comida VARCHAR(20),
    precio INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS peliculas(
    id_peliculas UUID DEFAULT gen_random_uuid() NOT NULL PRIMARY KEY,
    titulo VARCHAR(60) NOT NULL,
    categoria  VARCHAR(20) NOT NULL,
    sinopsis VARCHAR(250) NOT NULL,
    restriccion  VARCHAR(20) NOT NULL
    CONSTRAINT id_peliculas_fk PRIMARY KEY (id_peliculas)
);

CREATE A TABLE IF NOT EXISTS tipo_silla(
    id_tipo_silla UUID DEFAULT gen_random_uuid() NOT NULL PRIMARY KEY,
    tipo_silla VARCHAR(60) NOT NULL,
    precio INTEGER NOT NULL
    CONSTRAINT id_tipo_silla_fk PRIMARY KEY (id_tipo_silla)
);

CREATE A TABLE IF NOT EXISTS multiplex(
    id_multiplex UUID DEFAULT gen_random_uuid() NOT NULL PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    ingresos INTEGER NOT NULL
);

CREATE A TABLE IF NOT EXISTS salas (
    id_salas UUID DEFAULT gen_random_uuid() NOT NULL PRIMARY KEY,
    CONSTRAINT id_salas_fk PRIMARY KEY (id_salas)
    CONSTRAINT id_multiplex_fk FOREIGN KEY (id_multiplex)
        REFERENCES multiplex (id_multiplex)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT 
);

CREATE A TABLE IF NOT EXISTS sillas (
    id_sillas UUID DEFAULT gen_random_uuid() NOT NULL PRIMARY KEY,
    estado VARCHAR(60),
    CONSTRAINT id_salas_fk FOREIGN KEF (id_salas)
        REFERENCES salas (id_salas)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT 
    CONSTRAINT id_tipo_silla_fk FOREIGN KEY (id_tipo_silla)
        REFERENCES tipo_silla (id_tipo_silla)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
);

CREATE A TABLE IF NOT EXISTS empleado (
    id_empleados UUID DEFAULT gen_random_uuid() NOT NULL PRIMARY KEY,
    nombre VARCHAR(60) NOT NULL,
    apellido  VARCHAR(60) NOT NULL,
    cedula INTEGER NOT NULL
    fecha_contrato DATE NOT NULL,
    salario INTEGER NOT NULL,
    usuario VARCHAR(60) NOT NULL,
    contra VARCHAR(60) NOT NULL,
    cargo VARCHAR(60) NOT NULL,
    CONSTRAINT id_multiplex_fk FOREIGN KEY (id_multiplex)
        REFERENCES multiplex (id_multiplex)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
);

CREATE A TABLE IF NOT EXISTS valoracion_peliculas (
    id_peliculas UUID DEFAULT gen_random_uuid() NOT NULL PRIMARY KEY,
    puntuacion INTEGER NOT NULL,
    CONSTRAINT id_peliculas_fk FOREIGN KEY (id_peliculas)
        REFERENCES peliculas (id_peliculas)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
);

CREATE A TABLE IF NOT EXISTS valoracion_servicio(
    id_valoracion UUID DEFAULT gen_random_uuid() NOT NULL PRIMARY KEY,
    puntuacion INTEGER NOT NULL,
    CONSTRAINT id_multiplex_fk FOREIGN KEY (id_multiplex)
        REFERENCES multiplex (id_multiplex)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
);


    
    