DELIMITER $$

CREATE PROCEDURE Depositar(IN cuenta INT, IN monto DECIMAL(10,2))
BEGIN
    -- Suma el monto al saldo de la cuenta
    UPDATE Cuentas
    SET saldo = saldo + monto
    WHERE numero_cuenta = cuenta;

    -- Registra el movimiento como crédito
    INSERT INTO Movimientos (numero_cuenta, fecha, tipo, importe)
    VALUES (cuenta, CURDATE(), 'CREDITO', monto);
END$$

DELIMITER ;
