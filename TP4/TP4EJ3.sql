DELIMITER $$

CREATE PROCEDURE VerCuentas()
BEGIN
  SELECT 
    Cuentas.numero_cuenta AS 'Número de Cuenta',
    Clientes.apellido AS 'Apellido',
    Clientes.nombre AS 'Nombre',
    Cuentas.saldo AS 'Saldo Actual'
  FROM Cuentas
  INNER JOIN Clientes 
    ON Cuentas.numero_cliente = Clientes.numero_cliente
  ORDER BY Cuentas.numero_cuenta;
END$$

DELIMITER ;
CALL VerCuentas();