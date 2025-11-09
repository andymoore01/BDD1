DELIMITER $$
CREATE PROCEDURE CuentasConSaldoMayorQue(IN limite DECIMAL(10,2))
BEGIN
  SELECT 
    Cuentas.numero_cuenta AS 'Numero de Cuenta',
    Clientes.apellido AS 'Apellido',
    Clientes.nombre AS 'Nombre',
    Cuentas.saldo AS 'Saldo Actual'
  FROM Cuentas
  INNER JOIN Clientes 
    ON Cuentas.numero_cliente = Clientes.numero_cliente
  WHERE Cuentas.saldo > limite
  ORDER BY Cuentas.saldo DESC;
END$$
DELIMITER ;

CALL CuentasConSaldoMayorQue(1500.00);