CREATE DATABASE Hotel;

USE Hotel;

-- Tabla de clientes
CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    dni VARCHAR(15),
    nombre VARCHAR(50),
    apellidos VARCHAR(50),
    telefono VARCHAR(15),
    email VARCHAR(50)
);

-- Tabla de habitaciones
CREATE TABLE Habitaciones (
    id_habitacion INT AUTO_INCREMENT PRIMARY KEY,
    numero INT,
    tipo VARCHAR(30),
    precio DECIMAL(8,2),
    estado VARCHAR(20)
);

-- Tabla de reservas
CREATE TABLE Reservas (
    id_reserva INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_habitacion INT,
    fecha_entrada DATE,
    fecha_salida DATE,
    precio_total DECIMAL(8,2),
    estado VARCHAR(20),

    FOREIGN KEY (id_cliente)
        REFERENCES Clientes(id_cliente),

    FOREIGN KEY (id_habitacion)
        REFERENCES Habitaciones(id_habitacion)
);

-- Tabla de huespedes de cada reserva
CREATE TABLE Huespedes (
    id_huesped INT AUTO_INCREMENT PRIMARY KEY,
    id_reserva INT,
    id_cliente INT,

    FOREIGN KEY (id_reserva) REFERENCES Reservas(id_reserva),

    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

-- Tabla de historial de estancias
CREATE TABLE Historial (
    id_historial INT AUTO_INCREMENT PRIMARY KEY,
    id_reserva INT,
    fecha_entrada DATE,
    fecha_salida DATE,
    importe DECIMAL(8,2),

    FOREIGN KEY (id_reserva) REFERENCES Reservas(id_reserva)
);