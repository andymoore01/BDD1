DELIMITER $$

CREATE PROCEDURE Extraer(IN cuenta INT, IN monto DECIMAL(10,2))
BEGIN
  DECLARE saldo_actual DECIMAL(10,2);

  
  SELECT saldo INTO saldo_actual
  FROM Cuentas
  WHERE numero_cuenta = cuenta;

  
  IF saldo_actual IS NULL THEN
    SELECT 'La cuenta no existe' AS mensaje;
  ELSE
    
    IF saldo_actual < monto THEN
      SELECT 'Fondos insuficientes' AS mensaje;
    ELSE
      -- resto monto al saldo
      UPDATE Cuentas
      SET saldo = saldo - monto
      WHERE numero_cuenta = cuenta;

      -- registro movimiento 
      INSERT INTO Movimientos (numero_cuenta, fecha, tipo, importe)
      VALUES (cuenta, CURDATE(), 'DEBITO', monto);

      SELECT CONCAT('Se extrajeron $', monto, ' de la cuenta ', cuenta) AS mensaje;
    END IF;
  END IF;
END$$

DELIMITER ;
