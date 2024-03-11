-- Creacion de nueva tabla "propiedades" para unir ambos csv"

CREATE TABLE propiedades AS
SELECT *
FROM "2023_03_08_Precios_Casas_RM";

SELECT * FROM propiedades;

INSERT INTO propiedades
SELECT *
FROM "2023_07_18_Propiedades_Web_Scrape" t1
WHERE NOT EXISTS (
    SELECT id
    FROM propiedades t2
    WHERE t2.id = t1.id
);

-- Revision de duplicados con misma "id" --

SELECT id, COUNT(id) AS cantidad
FROM propiedades
GROUP BY id
HAVING COUNT(id) > 1;

SELECT * FROM propiedades
WHERE id = 10215663;

-- Al encontrar solo una id duplicada, se procede a borrar --

DELETE FROM propiedades
WHERE id = 10215663;

-- Recuento de datos en cada Comuna

SELECT Comuna, COUNT(Comuna) FROM propiedades
GROUP BY Comuna;

-- Propiedades con un valor menos a 10.000.000 CLP

SELECT * FROM propiedades
WHERE Price_CLP < 10000000;

-- Decidi continuar el proyecto en Python