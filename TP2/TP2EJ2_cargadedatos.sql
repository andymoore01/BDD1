CREATE DATABASE TP2EJ2;
USE TP2EJ2;

CREATE TABLE Clientes(
  dni INT PRIMARY KEY NOT NULL,
  nombre VARCHAR(100),
  direccion VARCHAR(255)
);
CREATE TABLE Asuntos(
  numero_expediente INT PRIMARY KEY NOT NULL,
  dni_cliente INT NOT NULL,
  fecha_inicio DATE,
  fecha_fin DATE,
  estado VARCHAR(50),
  FOREIGN KEY (dni_cliente) REFERENCES Clientes(dni)
);
CREATE TABLE Procuradores(
  id_procurador INT PRIMARY KEY NOT NULL,
  nombre VARCHAR(100),
  direccion VARCHAR(255)
);
CREATE TABLE Asuntos_Procuradores (
    numero_expediente INT NOT NULL,
    id_procurador INT NOT NULL,
    PRIMARY KEY (numero_expediente, id_procurador),
    FOREIGN KEY (numero_expediente) REFERENCES Asuntos(numero_expediente),
    FOREIGN KEY (id_procurador) REFERENCES Procuradores(id_procurador)
);

-- Poblar la tabla Clientes
INSERT INTO Clientes (dni, nombre, direccion)
VALUES
('123456789', 'Juan Pérez', 'Calle Pueyrredón 3498, Buenos Aires'),
('987654321', 'Ana García', 'Calle 5 323, La Plata'),
('456123789', 'Luis Fernández', 'Avenida de Gral. Paz 1056, Bahía Blanca');

-- Poblar la tabla Asuntos
INSERT INTO Asuntos (numero_expediente, dni_cliente, fecha_inicio, fecha_fin, estado)
VALUES
(1, '123456789', '2023-01-15', '2023-07-20', 'Cerrado'),
(2, '987654321', '2023-05-10', NULL, 'Abierto'),
(3, '456123789', '2023-06-01', '2023-09-10', 'Cerrado');

-- Poblar la tabla Procuradores
INSERT INTO Procuradores (id_procurador, nombre, direccion)
VALUES
(1, 'Laura Sánchez', 'Calle Soler 3765, Buenos Aires'),
(2, 'Carlos López', 'Calle Estrellas 8, Mar del Plata'),
(3, 'Marta Díaz', 'Calle Estación 12, Olavarria');

-- Poblar la tabla Asuntos_Procuradores
INSERT INTO Asuntos_Procuradores (numero_expediente, id_procurador)
VALUES
(1, 1),
(2, 2),
(3, 3),
(2, 1);  -- Un asunto puede tener varios procuradores

