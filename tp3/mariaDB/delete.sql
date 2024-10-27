-- FUNCIONES

-- Ejercicio 1

-- a)
DROP FUNCTION IF EXISTS sumar_dos_numeros;

--e)
DROP FUNCTION IF EXISTS antiguedad_persona;

DELETE FROM asignado
WHERE fecha = '2024-10-16' AND legajo = 'ADM002' AND nombreCargo = 'Coordinador Area Administrativa';

DELETE FROM cargo
WHERE nombreCargo = 'Coordinador Area Administrativa';

----------------------------------------------------------------------------------------

-- PROCEDIMIENTOS Y TRIGGERS:

-- Ejercicio 2

-- a)
DROP FUNCTION IF EXISTS formatoStockSep2024;

DELETE FROM stock
WHERE MONTH(fecha) = 9 AND YEAR(fecha) = 2024;

-- c)
-- los datos insertados en el ejercicio fueron borrados con el trigger.
DROP TRIGGER IF EXISTS habilitarBorradoMedicamento;


-- e)
DROP TRIGGER IF EXISTS registrarLogEntregaMedicamento_insert;
DROP TRIGGER IF EXISTS registrarLogEntregaMedicamento_delete;
DROP TRIGGER IF EXISTS registrarLogEntregaMedicamento_update;

DROP TABLE IF EXISTS LOG_entregamedicamento;

-- f)
DROP TRIGGER IF EXISTS restriccion_registro_turno_insert;
DROP TRIGGER IF EXISTS restriccion_registro_turno_update;
-- eliminacion de los datos de prueba utilizados para el inciso:
DELETE FROM turno
WHERE idTurno IN (30, 31, 32);

DELETE FROM administrativo
WHERE legajo IN ('ADM0011', 'PSC005');

DELETE FROM personalClinico
WHERE legajo = 'ADM0011';

----------------------------------------------------------------------------------------

-- CURSORES
