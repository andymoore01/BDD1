DELIMITER $$

CREATE TRIGGER ActualizarSaldo
AFTER INSERT ON Movimientos
FOR EACH ROW
BEGIN
  IF NEW.tipo = 'CREDITO' THEN
    UPDATE Cuentas
    SET saldo = saldo + NEW.importe
    WHERE numero_cuenta = NEW.numero_cuenta;
  ELSEIF NEW.tipo = 'DEBITO' THEN
    UPDATE Cuentas
    SET saldo = saldo - NEW.importe
    WHERE numero_cuenta = NEW.numero_cuenta;
  END IF;
END$$

DELIMITER ;