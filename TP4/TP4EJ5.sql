DELIMITER $$

CREATE PROCEDURE TotalMovimientosDelMes(
    IN cuenta INT,
    OUT total DECIMAL(10,2)
)
BEGIN
    SELECT IFNULL(SUM(
        CASE 
            WHEN tipo = 'CREDITO' THEN importe
            WHEN tipo = 'DEBITO'  THEN -importe
            ELSE 0 
        END
    ), 0)
    INTO total
    FROM Movimientos
    WHERE numero_cuenta = cuenta
      AND YEAR(fecha) = YEAR(CURDATE())
      AND MONTH(fecha) = MONTH(CURDATE());
END$$

DELIMITER ;

SET @resultado := 0;
CALL TotalMovimientosDelMes(1008, @resultado);
SELECT @resultado AS TotalDelMes;

-- ejemplo: probar 1008
-- SELECT IFNULL(SUM(
--  CASE 
--    WHEN tipo='CREDITO' THEN importe
--    WHEN tipo='DEBITO' THEN -importe
--   ELSE 0
--  END
-- ),0) AS TotalOctubre
-- FROM Movimientos
-- WHERE numero_cuenta = 1008
--  AND YEAR(fecha)=2025
--  AND MONTH(fecha)=10;
