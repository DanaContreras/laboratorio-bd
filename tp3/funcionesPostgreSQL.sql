-- Ejercicio 1

CREATE OR REPLACE FUNCTION sumar_dos_numeros(a INT, b INT)
RETURNS INT AS $$ 
BEGIN 
RETURN a + b; 
END;
$$
LANGUAGE plpgsql;
