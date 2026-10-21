
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
    id_habitacion INT,
    fecha_entrada DATE,
    fecha_salida DATE,
    precio_total DECIMAL(8,2),
    estado VARCHAR(20),

    FOREIGN KEY (id_habitacion)
        REFERENCES Habitaciones(id_habitacion)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

-- Tabla intermedia clientes y reservas
CREATE TABLE Clientes_Reservas (
    id_cliente INT,
    id_reserva INT,
    es_titular BOOLEAN DEFAULT FALSE,

    PRIMARY KEY (id_cliente, id_reserva),

    FOREIGN KEY (id_cliente)
        REFERENCES Clientes(id_cliente)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    FOREIGN KEY (id_reserva)
        REFERENCES Reservas(id_reserva)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- Tabla del historial 
CREATE TABLE Historial (
    id_historial INT AUTO_INCREMENT PRIMARY KEY,
    id_reserva INT,
    fecha_entrada DATE,
    fecha_salida DATE,
    importe DECIMAL(8,2),

    FOREIGN KEY (id_reserva)
        REFERENCES Reservas(id_reserva)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);
