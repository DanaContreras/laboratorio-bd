  --Ejercicio 2.a
DROP VIEW IF EXISTS TurnoLocal

CREATE VIEW TurnoLocal
as SELECT *
FROM turno t 
WHERE t.fechaHora <= '2024-08-31'
WITH LOCAL CHECK OPTION

  --Ejercicio 2.b
DROP VIEW IF EXISTS TurnoCascade

CREATE VIEW TurnoCascade
as SELECT *
FROM turno t 
WHERE t.fechaHora <= '2024-08-31'
WITH CASCADED CHECK OPTION

  --Ejercicio 2.c
INSERT INTO TurnoLocal (idTurno, estado, fechaHora, legajoProfesional, legajoAdmin)
VALUES (101, 'LIBRE', '2019-01-01 09:00:00', 'PSC011', 'ADM009');

INSERT INTO TurnoLocal (idTurno, estado, fechaHora, legajoProfesional, legajoAdmin)
VALUES (102, 'RESERVADO', '2024-09-04 09:00:00', 'PSC012', 'ADM010');

  --Ejercicio 2.d
INSERT INTO TurnoCascade (idTurno, estado, fechaHora, legajoProfesional, legajoAdmin)
VALUES (103, 'RESERVADO', '2019-01-01', 'PSC009', 'ADM007');

INSERT INTO TurnoCascade (idTurno, estado, fechaHora, legajoProfesional, legajoAdmin)
VALUES (104, 'RESERVADO', '2024-09-04', 'PSC010', 'ADM008');

-- Ejercicio 2.e
DROP VIEW IF EXISTS TurnoLocal2

CREATE VIEW TurnoLocal2
as SELECT *
FROM TurnoLocal tl
WHERE year(tl.fechaHora) = 2024
WITH LOCAL CHECK OPTION

  --Ejercicio 2.f
DROP VIEW IF EXISTS TurnoCascade2

CREATE VIEW TurnoCascade2
as SELECT *
FROM TurnoCascade tc 
WHERE year(tc.fechaHora) = 2024
WITH CASCADED CHECK OPTION

  --Ejercicio 2.g
INSERT INTO TurnoLocal2 (idTurno, estado, fechaHora, legajoProfesional, legajoAdmin)
VALUES (105, 'LIBRE', '2024-01-01 09:00:00', 'PSC011', 'ADM009');

INSERT INTO TurnoLocal2 (idTurno, estado, fechaHora, legajoProfesional, legajoAdmin)
VALUES (106, 'RESERVADO', '2024-09-04 09:00:00', 'PSC012', 'ADM010');

  --Ejericicio 2.h
INSERT INTO TurnoCascade2 (idTurno, estado, fechaHora, legajoProfesional, legajoAdmin)
VALUES (107, 'RESERVADO', '2024-01-01', 'PSC009', 'ADM007');

INSERT INTO TurnoCascade2 (idTurno, estado, fechaHora, legajoProfesional, legajoAdmin)
VALUES (108, 'RESERVADO', '2024-09-04', 'PSC010', 'ADM008');
