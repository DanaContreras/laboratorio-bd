-- Ejercicio 1.a)
CREATE VIEW turnoLocal AS
SELECT *
FROM turno
WHERE fechaHora <= '2024-08-31 23:59:59'
WITH LOCAL CHECK OPTION;

-- Ejercicio 1.b)
CREATE VIEW turnoCascade AS
SELECT *
FROM turno
WHERE fechaHora <= '2024-08-31 23:59:59'
WITH CASCADED CHECK OPTION;

-- Ejercicio 1.b.a)
INSERT INTO TurnoLocal (idTurno, estado, fechaHora, legajoProfesional, legajoAdmin)
VALUES
	(101, 'RESERVADO', '2019-01-01', 'PSC011', 'ADM009'),
	(102, 'RESERVADO', '2019-01-01', 'PSC012', 'ADM010');

-- Ejercicio 1.b.b)
INSERT INTO turnoCascade (idTurno, estado, fechaHora, legajoProfesional, legajoAdmin)
VALUES
	(103, 'RESERVADO', '2019-01-01', 'PSC009', 'ADM007'),
	(104, 'RESERVADO', '2024-09-04', 'PSC010', 'ADM008');
