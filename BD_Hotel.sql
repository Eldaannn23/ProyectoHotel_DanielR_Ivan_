
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


USE Hotel;

-- 1. Insertar clientes
INSERT INTO Clientes (dni, nombre, apellidos, telefono, email) VALUES
('12345678A', 'Daniel', 'Garcia Lopez', '600111222', 'daniel@gmail.com'),
('23456789B', 'Laura', 'Martinez Ruiz', '600222333', 'laura@gmail.com'),
('34567890C', 'Carlos', 'Sanchez Perez', '600333444', 'carlos@gmail.com'),
('45678901D', 'Maria', 'Fernandez Gil', '600444555', 'maria@gmail.com'),
('56789012E', 'Javier', 'Lopez Martin', '600555666', 'javier@gmail.com'),
('67890123F', 'Andrea', 'Romero Diaz', '600666777', 'andrea@gmail.com'),
('78901234G', 'Pablo', 'Torres Moreno', '600777888', 'pablo@gmail.com'),
('89012345H', 'Lucia', 'Navarro Sanchez', '600888999', 'lucia@gmail.com');


-- 2. Insertar habitaciones
INSERT INTO Habitaciones (numero, tipo, precio, estado) VALUES
(101, 'Individual', 45.00, 'Disponible'),
(102, 'Doble', 65.00, 'Disponible'),
(103, 'Doble', 70.00, 'Ocupada'),
(104, 'Suite', 120.00, 'Disponible'),
(105, 'Individual', 40.00, 'Disponible'),
(106, 'Familiar', 95.00, 'Ocupada'),
(107, 'Suite', 150.00, 'Mantenimiento'),
(108, 'Doble', 60.00, 'Disponible');


-- 3. Insertar reservas
INSERT INTO Reservas
(id_habitacion, fecha_entrada, fecha_salida, precio_total, estado)
VALUES
(1, '2026-01-10', '2026-01-12', 90.00, 'Finalizada'),
(2, '2026-02-05', '2026-02-08', 195.00, 'Finalizada'),
(3, '2026-10-20', '2026-10-23', 210.00, 'En curso'),
(4, '2026-11-01', '2026-11-04', 360.00, 'Confirmada'),
(5, '2026-11-10', '2026-11-12', 80.00, 'Confirmada'),
(6, '2026-12-01', '2026-12-05', 380.00, 'Pendiente'),
(8, '2026-12-10', '2026-12-12', 120.00, 'Pendiente'),
(1, '2026-03-15', '2026-03-17', 90.00, 'Finalizada'),
(2, '2026-04-20', '2026-04-22', 130.00, 'Finalizada'),
(4, '2026-12-20', '2026-12-23', 360.00, 'Confirmada');


-- 4. Relacionar clientes con reservas
-- es_titular: 1 = titular, 0 = acompañante
INSERT INTO Clientes_Reservas
(id_cliente, id_reserva, es_titular)
VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 3, 0),
(5, 4, 1),
(6, 5, 1),
(7, 6, 1),
(8, 7, 1),
(1, 8, 1),
(2, 9, 1),
(3, 10, 1),
(4, 10, 0);


-- 5. Insertar historial de estancias
INSERT INTO Historial
(id_reserva, fecha_entrada, fecha_salida, importe)
VALUES
(1, '2026-01-10', '2026-01-12', 90.00),
(2, '2026-02-05', '2026-02-08', 195.00),
(8, '2026-03-15', '2026-03-17', 90.00),
(9, '2026-04-20', '2026-04-22', 130.00),
(3, '2026-10-20', NULL, 210.00);


SELECT * FROM Clientes;
SELECT * FROM Habitaciones;
SELECT * FROM Reservas;
SELECT * FROM Clientes_Reservas;
SELECT * FROM Historial;

