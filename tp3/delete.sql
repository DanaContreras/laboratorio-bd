-- Ejercicio 1
DROP FUNCTION IF EXISTS sumar_dos_numeros;

-- Ejercicio 2
-- a)
DROP FUNCTION IF EXISTS formatoStockSep2024;

DELETE FROM stock
WHERE EXTRACT(MONTH FROM fecha) = 9 AND EXTRACT(YEAR FROM fecha) = 2024;

