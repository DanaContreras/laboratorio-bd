-- Ejercicio 1

CREATE OR REPLACE FUNCTION sumar_dos_numeros(a INT, b INT)
RETURNS INT AS $$ 
BEGIN 
RETURN a + b; 
END;
$$
LANGUAGE plpgsql;

-- Ejercicio 2
-- a)
CREATE FUNCTION formatoStockSep2024 (nombre VARCHAR, dosis INT, cantidad INT, fecha TIMESTAMP)
RETURNS TEXT
AS $$
BEGIN
	RETURN 'El medicamento ' || nombre ||
	', con dosis ' || dosis ||
	' registró un stock de ' || cantidad ||
	' unidades, el ' || TO_CHAR(fecha, 'DD-MM-YYYY') ||
	' a las ' || TO_CHAR(fecha, 'HH24:MI:SS') || '.';
END;
$$
Language plpgsql;
