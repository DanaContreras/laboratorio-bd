-- FUNCTIONS

-- Ejercicio 1
DROP FUNCTION IF EXISTS sumar_dos_numeros;
DROP FUNCTION IF EXISTS suma;
DROP FUNCTION IF EXISTS test;
DROP FUNCTION IF EXISTS foo;
DROP FUNCTION IF EXISTS multiplicar;
-- Ejercicio 2
-- a)
DROP FUNCTION IF EXISTS formatoStockSep2024;

DELETE FROM stock
WHERE EXTRACT(MONTH FROM fecha) = 9 AND EXTRACT(YEAR FROM fecha) = 2024;

-- e) 
DROP FUNCTION IF EXISTS antiguedad_persona;

DELETE FROM asignado
WHERE fecha = '2024-10-16' AND legajo = 'ADM002' AND nombreCargo = 'Coordinador Area Administrativa';

DELETE FROM cargo
WHERE nombreCargo = 'Coordinador Area Administrativa';

-------------------------------------------------------------------------------------------

-- PROCEDIMIENTOS Y TRIGGERS

-- Ejercicio a)
ALTER TABLE administrativo
DROP COLUMN cantidadcargos;

-- Ejercicio c)
-- los datos insertados en el ejercicio fueron borrados con el trigger.
DROP TRIGGER IF EXISTS habilitarBorradoMedicamento ON medicamento;
DROP FUNCTION IF EXISTS deleteRefMedicamento;

-- Ejercicio d)
DROP TABLE LOG_entregamedicamento;

-- Ejercicio e)
-- los datos insertados en el ejercicio son eliminados en la ultima operacion (delete)
DROP TRIGGER IF EXISTS registrarLogEntregaMedicamento ON entregaMedicamento;
DROP FUNCTION IF EXISTS insertLog;

-- Ejercicio f)
DROP TRIGGER IF EXISTS restriccion_registro_turno ON turno;
DROP TRIGGER IF EXISTS validar_registro_turno;
-- eliminacion de los datos de prueba utilizados para el inciso:
DELETE FROM turno
WHERE idTurno IN (30, 31, 32);

DELETE FROM administrativo
WHERE legajo IN ('ADM0011', 'PSC005');

DELETE FROM personalClinico
WHERE legajo = 'ADM0011';

-------------------------------------------------------------------------------------------

-- CURSORES

-- Ejercicio 2)
DROP FUNCTION IF EXISTS cancelarTurnosOct2024;

DELETE FROM turno
WHERE idTurno IN (20, 21, 22, 23, 24);



