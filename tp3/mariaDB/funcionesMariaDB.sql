-- Ejercicio 1
CREATE OR REPLACE FUNCTION sumar_dos_numeros(a INT, b INT)
RETURNS INT
DETERMINISTIC
BEGIN
   RETURN a + b;
END


--Ejercicio 2
-- e
USE LabBD_Maria;
DELIMITER $$

CREATE OR REPLACE FUNCTION antiguedad_persona(legajoIn VARCHAR(15))
RETURNS TEXT
DETERMINISTIC
BEGIN
 -- Declaración de variables
 DECLARE fecha_registro DATE;
 DECLARE años INT;
 DECLARE meses INT;
 DECLARE dias INT;

 -- Obtiene la primera fecha de cargo asignado
 SELECT MIN(a.fecha)
 INTO fecha_registro
 FROM asignado a
 WHERE a.legajo = legajoIn;

 -- Si no se encontró fecha, entonces devuelve un mensaje
 IF fecha_registro IS NULL THEN
 RETURN CONCAT(legajoIn, ' no tiene asignado un cargo administrativo');
 END IF;

 -- Calcula años,meses y dias utilizando TIMESTAMPDIFF
 SET años = TIMESTAMPDIFF(YEAR, fecha_registro, CURDATE());
 SET meses = TIMESTAMPDIFF(MONTH, fecha_registro, CURDATE());
 SET dias =  TIMESTAMPDIFF(DAY, fecha_registro, CURDATE());

 -- Retorna la diferencia en años, meses y días
 RETURN CONCAT('El personal administrativo con legajo ', legajoIn,
             ' tiene una antigüedad de Años= ', años,
             ' Meses = ', meses,
             ' Dias = ', dias);
END $$

DELIMITER ;