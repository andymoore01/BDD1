DROP DATABASE banco;
CREATE DATABASE banco;
USE BANCO;

CREATE TABLE Clientes(
numero_cliente INT PRIMARY KEY NOT NULL,
dni INT NOT NULL,
apellido VARCHAR(60) NOT NULL,
nombre VARCHAR(60) NOT NULL);

CREATE TABLE Cuentas(
numero_cuenta INT PRIMARY KEY NOT NULL,
numero_cliente INT NOT NULL,
saldo DECIMAL(10,2) NOT NULL,
FOREIGN KEY(numero_cliente)REFERENCES Clientes(numero_cliente));

CREATE TABLE Movimientos(
numero_movimiento INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
numero_cuenta INT NOT NULL,
fecha DATE NOT NULL,
tipo ENUM('CREDITO', 'DEBITO') NOT NULL,
importe DECIMAL(10,2) NOT NULL,
FOREIGN KEY (numero_cuenta) REFERENCES Cuentas(numero_cuenta));

CREATE TABLE historial_movimientos(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
numero_cuenta INT NOT NULL,
numero_movimiento INT NOT NULL,
saldo_anterior DECIMAL(10,2) NOT NULL,
saldo_actual DECIMAL(10,2) NOT NULL,
FOREIGN KEY (numero_cuenta) REFERENCES Cuentas(numero_cuenta),
FOREIGN KEY (numero_movimiento) REFERENCES Movimientos(numero_movimiento)
);