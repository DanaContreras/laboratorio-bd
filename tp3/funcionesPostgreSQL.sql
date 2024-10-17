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
CREATE FUNCTION formatoStockSep2024 ()
RETURNS TABLE(formato TEXT)
AS $$
BEGIN
	RETURN QUERY
	SELECT 'El medicamento ' || m.nombre ||
	', con dosis ' || m.dosis ||
	' registró un stock de ' || s.cantidad ||
	' unidades, el ' || TO_CHAR(s.fecha, 'DD-MM-YYYY') ||
	' a las ' || TO_CHAR(s.fecha, 'HH24:MI:SS') || '.'
	FROM medicamento m JOIN stock s ON m.idMedicamento = s.idMedicamento
	WHERE EXTRACT(MONTH FROM s.fecha) = 9 AND EXTRACT(YEAR FROM s.fecha) = 2024;
END;
$$
Language plpgsql;
