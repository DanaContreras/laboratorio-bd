-- Ejercicio 1
-- a)
CREATE OR REPLACE FUNCTION sumar_dos_numeros(a INT, b INT)
RETURNS INT AS $$ 
BEGIN 
RETURN a + b; 
END;
$$
LANGUAGE plpgsql;

-- c) Overloading

CREATE FUNCTION suma(a int,b int) RETURNS int AS $$
BEGIN
	RETURN a+b;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION suma(a int,b int,c int) RETURNS int AS $$
BEGIN
	RETURN a+b+c;
END;
$$ LANGUAGE plpgsql;

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


-- e)
CREATE OR REPLACE FUNCTION antiguedad_persona(legajoIn varchar(15))
RETURNS text AS $$
DECLARE
 fecha_registro date;
 diferencia interval;
 años int;
 meses int;
 dias int;
BEGIN
 -- Obtiene la primera fecha de cargo asignado
 SELECT MIN(a.fecha)
 INTO fecha_registro
 FROM asignado a
 WHERE a.legajo = legajoIn;

 -- Si no se encontró fecha, entonces devuelve null
 IF fecha_registro IS NULL THEN
   RETURN legajoIn || ' no tiene asignado un cargo administrativo';
 END IF;

 -- Asignamos los valores a las variables usando EXTRACT
 años := EXTRACT(YEAR FROM now()) - EXTRACT(YEAR FROM fecha_registro);
 meses := EXTRACT(MONTH FROM now()) - EXTRACT(MONTH FROM fecha_registro);

 -- Calculamos la diferencia pero usando la operación - para obtener los días
 diferencia := now() - fecha_registro;
 dias := EXTRACT(DAY FROM diferencia)::int;

 -- Retorna la diferencia en años, meses y días
 RETURN 'El personal administrativo con legajo ' || legajoIn ||
        ' tiene una antigüedad de Años= ' || años ||
        ' Meses = ' || meses ||
        ' Dias = ' || dias;
END;
$$ LANGUAGE plpgsql;