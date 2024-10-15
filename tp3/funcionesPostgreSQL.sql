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
RETURNS TABLE(nombre VARCHAR, dosis INT, fecha DATE, cantidad INT)
AS $$
BEGIN
	RETURN QUERY
	SELECT m.nombre, m.dosis, s.fecha, s.cantidad
	FROM medicamento m JOIN stock s ON m.idMedicamento = s.idMedicamento
	WHERE EXTRACT(MONTH FROM s.fecha) = 9 AND EXTRACT(YEAR FROM s.fecha) = 2024;
END;
$$
Language plpgsql;
