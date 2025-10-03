-- ¿Cuál es el nombre y la dirección de los procuradores que han trabajado en un asunto abierto?
SELECT Procuradores.nombre, Procuradores.direccion FROM Procuradores
INNER JOIN Asuntos_Procuradores
    ON Procuradores.id_procurador = Asuntos_Procuradores.id_procurador
INNER JOIN Asuntos
    ON Asuntos_Procuradores.numero_expediente = Asuntos.numero_expediente
WHERE Asuntos.estado = 'Abierto';

-- ¿Qué clientes han tenido asuntos en los que ha participado el procurador Carlos López?
SELECT Clientes.nombre, Clientes.direccion FROM Clientes
INNER JOIN Asuntos
    ON Clientes.dni = Asuntos.dni_cliente
INNER JOIN Asuntos_Procuradores
    ON Asuntos.numero_expediente = Asuntos_Procuradores.numero_expediente
INNER JOIN Procuradores
    ON Asuntos_Procuradores.id_procurador = Procuradores.id_procurador
WHERE Procuradores.nombre = 'Carlos López';

-- ¿Cuántos asuntos ha gestionado cada procurador?
SELECT Procuradores.nombre, COUNT(Asuntos_Procuradores.numero_expediente) AS cantidad_asuntos FROM Procuradores
INNER JOIN Asuntos_Procuradores
    ON Procuradores.id_procurador = Asuntos_Procuradores.id_procurador
GROUP BY Procuradores.nombre;

-- Lista los números de expediente y fechas de inicio de los asuntos de los clientes que viven en Buenos Aires.
SELECT Asuntos.numero_expediente, Asuntos.fecha_inicio
FROM Asuntos
INNER JOIN Clientes
    ON Asuntos.dni_cliente = Clientes.dni
WHERE Clientes.direccion LIKE '%Buenos Aires%';

