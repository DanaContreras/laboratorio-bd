-- FUNCIONES

-- Ejercicio 1

-- a)
DROP FUNCTION IF EXISTS sumar_dos_numeros;

----------------------------------------------------------------------------------------

-- PROCEDIMIENTOS Y TRIGGERS:

-- Ejercicio 2

-- a)
DROP FUNCTION IF EXISTS formatoStockSep2024;

DELETE FROM stock
WHERE MONTH(fecha) = 9 AND YEAR(fecha) = 2024;

-- e)
DROP TRIGGER IF EXISTS registrarLogEntregaMedicamento_insert;
DROP TRIGGER IF EXISTS registrarLogEntregaMedicamento_delete;
DROP TRIGGER IF EXISTS registrarLogEntregaMedicamento_update;

----------------------------------------------------------------------------------------

-- CURSORES
