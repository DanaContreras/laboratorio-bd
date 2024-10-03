-- 1.a
DROP VIEW TurnoLocal

CREATE VIEW TurnoLocal
as SELECT *
FROM turno t 
WHERE t.fechaHora <= '2024-08-31'
WITH LOCAL CHECK OPTION
