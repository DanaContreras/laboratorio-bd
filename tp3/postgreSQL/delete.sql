-- FUNCTIONS

-- Ejercicio 1
DROP FUNCTION IF EXISTS sumar_dos_numeros;

-- Ejercicio 2
-- a)
DROP FUNCTION IF EXISTS formatoStockSep2024;

DELETE FROM stock
WHERE EXTRACT(MONTH FROM fecha) = 9 AND EXTRACT(YEAR FROM fecha) = 2024;

-------------------------------------------------------------------------------------------

-- PROCEDIMIENTOS Y TRIGGERS

-- Ejercicio c)
-- los datos insertados en el ejercicio fueron borrados con el trigger.
DROP TRIGGER IF EXISTS habilitarBorradoMedicamento ON medicamento;
DROP FUNCTION IF EXISTS deleteRefMedicamento;

-- Ejercicio e)
-- los datos insertados en el ejercicio son eliminados en la ultima operacion (delete)
DROP TRIGGER IF EXISTS registrarLogEntregaMedicamento ON entregaMedicamento;
DROP FUNCTION IF EXISTS insertLog;

-------------------------------------------------------------------------------------------

-- CURSORES

-- Ejercicio 2)
DROP FUNCTION IF EXISTS cancelarTurnosOct2024;

DELETE FROM turno
WHERE idTurno IN (20, 21, 22, 23, 24);



