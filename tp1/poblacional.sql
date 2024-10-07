DELETE FROM sot;
DELETE FROM requiereDe;
DELETE FROM entregaMedicamento;
DELETE FROM stock;
DELETE FROM medicamento;
DELETE FROM recetaMedica;
DELETE FROM solicita;
DELETE FROM registroBaja;
DELETE FROM asignado;
DELETE FROM turno;
DELETE FROM evolucion;
DELETE FROM contiene;
DELETE FROM nomenclador;
DELETE FROM recibe;
DELETE FROM diagnosticoMultiaxial;
DELETE FROM eje;
DELETE FROM acompanianteTerapeutico;
DELETE FROM enfermera;
DELETE FROM psicologo;
DELETE FROM psiquiatra;
DELETE FROM administrativo;
DELETE FROM profesional;
DELETE FROM personalClinico;
DELETE FROM cargo;
DELETE FROM paciente;
DELETE FROM tratamientoGravedad;

INSERT INTO paciente (dni, tipoDni, nombre, apellido, obraSocial, fechaNac, fechaIngreso, foto)
VALUES 
    ('12345678', 'DNI', 'Juan', 'Pérez', 'OSDE', '1985-04-12', '2023-08-01', 'https://example.com/foto1.jpg'),
    ('87654321', 'Pasaporte', 'María', 'Gómez', 'Swiss Medical', '1990-06-22', '2024-01-15', 'https://example.com/foto2.jpg'),
    ('34567890', 'DNI', 'Carlos', 'López', 'Galeno', '1980-12-30', '2022-11-10', 'https://example.com/foto3.jpg'),
    ('65432109', 'DNI', 'Lucía', 'Martínez', 'OSDE', '1995-09-15', '2021-03-23', 'https://example.com/foto4.jpg'),
    ('78901234', 'Cédula', 'Roberto', 'Fernández', 'Medifé', '1978-07-05', '2023-07-01', 'https://example.com/foto5.jpg'),
    ('11223344', 'DNI', 'Jorge', 'Ramírez', 'OSDE', '1983-08-15', '2024-01-02', 'https://example.com/fotoJorge.jpg'),
    ('22334455', 'DNI', 'Ana', 'Suárez', 'Galeno', '1991-05-23', '2024-02-10', 'https://example.com/fotoAna.jpg'),
    ('1234567890', 'DNI', 'Juan', 'Pérez', 'OSDE', '1990-05-15', '2023-01-10', 'https://example.com/foto1.jpg'),
    ('0987654321', 'DNI', 'María', 'González', 'Swiss Medical', '1985-08-23', '2023-02-12', 'https://example.com/foto2.jpg'),
    ('1122334455', 'PASAPORTE', 'Carlos', 'Ramírez', 'Medifé', '1978-12-02', '2023-03-20', 'https://example.com/foto3.jpg'),
    ('0987654111', 'DNI', 'María', 'González', 'Swiss Medical', '1985-08-23', '2023-02-12', 'https://example.com/foto2.jpg');

INSERT INTO tratamientoGravedad (idTratamiento, gravedad, frecuencia)
VALUES 
    (1, 'Grave intensivo', 'DIA COMPLETO'),
    (2, 'Ambulatorio', 'SEMANAL'),
    (3, 'Grave intensivo', 'DIA COMPLETO'),
    (4, 'Grave medianamente intensivo', 'SEMANAL'),
    (5, 'Ambulatorio', 'MENSUAL'),
    (6, 'Grave intensivo', 'DIA COMPLETO'),
    (7, 'Grave intensivo', 'SEMANAL'),
    (8, 'Ambulatorio', 'DIA COMPLETO'),
    (9, 'Grave medianamente intensivo', 'QUINCENAL'),
    (10, 'Ambulatorio', 'MENSUAL');

INSERT INTO recibe (fechaInicio, fechaFin, dni, tipoDni, idTratamiento)
VALUES  --
    ('2024-01-10', '2024-03-10', '12345678', 'DNI', 1),
    ('2023-01-15', '2023-02-15', '1234567890', 'DNI', 3),
    ('2023-03-01', '2023-04-01', '1234567890', 'DNI', 5),
    ('2023-01-20', '2023-02-20', '0987654321', 'DNI', 4),
    ('2023-04-01', '2023-05-01', '0987654321', 'DNI', 6),
    ('2023-03-15', '2023-04-15', '0987654321', 'DNI', 7),
    ('2023-02-10', '2023-03-10', '1122334455', 'PASAPORTE', 8),
    ('2023-04-05', '2023-05-05', '1122334455', 'PASAPORTE', 9),
    ('2023-05-01', '2023-06-01', '1122334455', 'PASAPORTE', 10),
    ('2023-06-10', '2023-07-10', '1234567890', 'DNI', 10);

INSERT INTO personalClinico (legajo, nombre, apellido, contrasenia, fechaNac, fotoPerfil, email, estado)
VALUES 
    ('ACO123456', 'Ana', 'Martínez', 'password123', '1985-05-15', 'https://example.com/fotoPerfil.jpg', 'ana.martinez@example.com', 'ACTIVO'),
    ('ADM001', 'Ana', 'Gómez', 'adminpass', '1985-05-22', 'foto2.jpg', 'ana.gomez@example.com', 'ACTIVO'),
    ('PSQ001', 'Javier', 'Sánchez', 'password456', '1995-02-20', 'https://example.com/fotoPerfilJavier.jpg', 'javier.sanchez@example.com', 'ACTIVO'),
    ('PSC003', 'Clara', 'Rodríguez', 'password789', '1975-11-25', 'https://example.com/fotoPerfilClara.jpg', 'clara.rodriguez@example.com', 'ACTIVO'),
    ('ENF001', 'Laura', 'González', 'password321', '1987-03-14', 'https://example.com/fotoLaura.jpg', 'laura.gonzalez@example.com', 'ACTIVO'),
    ('PSC002', 'Luis', 'Martínez', 'password654', '1992-11-30', 'https://example.com/fotoLuis.jpg', 'luis.martinez@example.com', 'BAJA'),
    ('PSC004', 'María', 'Pérez', 'securepass123', '1990-06-12', 'https://example.com/fotoMaria.jpg', 'maria.perez@example.com', 'ACTIVO'),
    ('ADM002', 'Carlos', 'Fernández', 'adminsecure789', '1988-08-05', 'https://example.com/fotoCarlos.jpg', 'carlos.fernandez@example.com', 'ACTIVO'),
    ('ADM003', 'Laura', 'Sánchez', 'pass123', '1984-04-12', 'foto7.jpg', 'laura.sanchez@example.com', 'ACTIVO'),
    ('ADM004', 'Javier', 'Torres', 'pass123', '1991-01-16', 'foto8.jpg', 'javier.torres@example.com', 'ACTIVO'),
    ('ADM005', 'Marta', 'Romero', 'pass123', '1978-09-22', 'foto9.jpg', 'marta.romero@example.com', 'ACTIVO'),
    ('ADM006', 'Fernando', 'García', 'pass123', '1989-05-30', 'foto10.jpg', 'fernando.garcia@example.com', 'ACTIVO'),
    ('ADM007', 'Sofía', 'Méndez', 'pass123', '1993-12-15', 'foto11.jpg', 'sofia.mendez@example.com', 'ACTIVO'),
    ('ADM008', 'Ricardo', 'Castro', 'pass123', '1981-06-20', 'foto12.jpg', 'ricardo.castro@example.com', 'ACTIVO'),
    ('ADM009', 'Elena', 'Vázquez', 'pass123', '1987-10-05', 'foto13.jpg', 'elena.vazquez@example.com', 'ACTIVO'),
    ('ADM010', 'Manuel', 'Hernández', 'pass123', '1992-03-18', 'foto14.jpg', 'manuel.hernandez@example.com', 'ACTIVO'),
    ('PSQ002', 'Gabriela', 'Molina', 'pass123', '1983-07-10', 'foto15.jpg', 'gabriela.molina@example.com', 'ACTIVO'),
    ('PSQ003', 'Ricardo', 'Morales', 'pass123', '1986-11-25', 'foto16.jpg', 'ricardo.morales@example.com', 'ACTIVO'),
    ('PSQ004', 'Elena', 'Paredes', 'pass123', '1979-02-14', 'foto17.jpg', 'elena.paredes@example.com', 'ACTIVO'),
    ('PSQ005', 'Diego', 'Rivas', 'pass123', '1995-08-30', 'foto18.jpg', 'diego.rivas@example.com', 'ACTIVO'),
    ('PSQ006', 'Patricia', 'Navarro', 'pass123', '1980-06-15', 'foto19.jpg', 'patricia.navarro@example.com', 'ACTIVO'),
    ('PSQ007', 'Jorge', 'Salazar', 'pass123', '1987-04-05', 'foto20.jpg', 'jorge.salazar@example.com', 'ACTIVO'),
    ('PSQ008', 'Martín', 'García', 'pass123', '1983-12-22', 'foto21.jpg', 'martin.garcia@example.com', 'ACTIVO'),
    ('PSQ009', 'Lucía', 'Vega', 'pass123', '1992-11-18', 'foto22.jpg', 'lucia.vega@example.com', 'ACTIVO'),
    ('PSQ010', 'Esteban', 'Cruz', 'pass123', '1984-05-25', 'foto23.jpg', 'esteban.cruz@example.com', 'ACTIVO'),
    ('ACO123457', 'Natalia', 'Guzmán', 'pass123', '1981-07-20', 'foto24.jpg', 'natalia.guzman@example.com', 'ACTIVO'),
    ('ACO123458', 'Luis', 'Pinto', 'pass123', '1990-02-10', 'foto25.jpg', 'luis.pinto@example.com', 'ACTIVO'),
    ('ACO123459', 'Sandra', 'Bravo', 'pass123', '1988-09-15', 'foto26.jpg', 'sandra.bravo@example.com', 'ACTIVO'),
    ('ACO123460', 'Andrés', 'Palacios', 'pass123', '1993-01-05', 'foto27.jpg', 'andres.palacios@example.com', 'ACTIVO'),
    ('ACO123461', 'Carla', 'Benítez', 'pass123', '1982-06-25', 'foto28.jpg', 'carla.benitez@example.com', 'ACTIVO'),
    ('ACO123462', 'Alejandro', 'Mora', 'pass123', '1989-12-12', 'foto29.jpg', 'alejandro.mora@example.com', 'ACTIVO'),
    ('ACO123463', 'Mónica', 'Pérez', 'pass123', '1985-11-20', 'foto30.jpg', 'monica.perez@example.com', 'ACTIVO'),
    ('ACO123464', 'Sergio', 'Cordero', 'pass123', '1991-08-18', 'foto31.jpg', 'sergio.cordero@example.com', 'ACTIVO'),
    ('ACO123465', 'Andrea', 'Araya', 'pass123', '1980-04-10', 'foto32.jpg', 'andrea.araya@example.com', 'ACTIVO'),
    ('ENF002', 'Raquel', 'Moreno', 'pass123', '1983-07-25', 'foto33.jpg', 'raquel.moreno@example.com', 'ACTIVO'),
    ('ENF003', 'Oscar', 'Pinto', 'pass123', '1992-09-05', 'foto34.jpg', 'oscar.pinto@example.com', 'ACTIVO'),
    ('ENF004', 'Victoria', 'Véliz', 'pass123', '1986-11-10', 'foto35.jpg', 'victoria.veliz@example.com', 'ACTIVO'),
    ('ENF005', 'Pablo', 'Marín', 'pass123', '1990-04-12', 'foto36.jpg', 'pablo.marin@example.com', 'ACTIVO'),
    ('ENF006', 'Jessica', 'Ríos', 'pass123', '1985-01-20', 'foto37.jpg', 'jessica.rios@example.com', 'ACTIVO'),
    ('ENF007', 'Alejandra', 'Salas', 'pass123', '1982-06-30', 'foto38.jpg', 'alejandra.salas@example.com', 'ACTIVO'),
    ('ENF008', 'Esteban', 'Bravo', 'pass123', '1991-05-15', 'foto39.jpg', 'esteban.bravo@example.com', 'ACTIVO'),
    ('ENF009', 'Gabriela', 'Reyes', 'pass123', '1987-07-25', 'foto40.jpg', 'gabriela.reyes@example.com', 'ACTIVO'),
    ('ENF010', 'Juan', 'Gómez', 'pass123', '1984-08-20', 'foto41.jpg', 'juan.gomez@example.com', 'ACTIVO'),
    ('PSC005', 'Martín', 'Castañeda', 'pass123', '1988-10-12', 'foto42.jpg', 'martin.castaneda@example.com', 'ACTIVO'),
    ('PSC006', 'Sandra', 'López', 'pass123', '1992-06-15', 'foto43.jpg', 'sandra.lopez@example.com', 'ACTIVO'),
    ('PSC007', 'Javier', 'Pérez', 'pass123', '1981-03-05', 'foto44.jpg', 'javier.perez@example.com', 'ACTIVO'),
    ('PSC008', 'Camila', 'Salazar', 'pass123', '1989-09-20', 'foto45.jpg', 'camila.salazar@example.com', 'ACTIVO'),
    ('PSC009', 'Nombre9', 'Apellido9', 'pass123', '1990-04-15', 'foto46.jpg', 'nombre9.apellido9@example.com', 'ACTIVO'),
    ('PSC010', 'Nombre10', 'Apellido10', 'pass123', '1985-07-25', 'foto47.jpg', 'nombre10.apellido10@example.com', 'ACTIVO'),
    ('PSC011', 'Nombre11', 'Apellido11', 'pass123', '1992-11-30', 'foto48.jpg', 'nombre11.apellido11@example.com', 'ACTIVO'),
    ('PSC012', 'Nombre12', 'Apellido12', 'pass123', '1988-02-20', 'foto49.jpg', 'nombre12.apellido12@example.com', 'ACTIVO');

INSERT INTO profesional (legajo, matricula)
VALUES 
    ('ACO123456', 'MAT123456789'),
    ('PSQ001', 'MAT001234569'),
    ('PSC003', 'MAT001234570'),
    ('ENF001', 'MAT000123456'),
    ('PSC002', 'MAT000654321'),
    ('PSC004', 'MAT000894546'),
    ('ADM003', 'MAT123456792'),
    ('ADM004', 'MAT123456793'),
    ('ADM005', 'MAT123456794'),
    ('ADM006', 'MAT123456795'),
    ('ADM007', 'MAT123456796'),
    ('ADM008', 'MAT123456797'),
    ('ADM009', 'MAT123456798'),
    ('ADM010', 'MAT123456799'),
    ('PSQ002', 'MAT001234570'),
    ('PSQ003', 'MAT001234571'),
    ('PSQ004', 'MAT001234572'),
    ('PSQ005', 'MAT001234573'),
    ('PSQ006', 'MAT001234574'),
    ('PSQ007', 'MAT001234575'),
    ('PSQ008', 'MAT001234576'),
    ('PSQ009', 'MAT001234577'),
    ('PSQ010', 'MAT001234578'),
    ('ACO123457', 'MAT123456792'),
    ('ACO123458', 'MAT123456793'),
    ('ACO123459', 'MAT123456794'),
    ('ACO123460', 'MAT123456795'),
    ('ACO123461', 'MAT123456796'),
    ('ACO123462', 'MAT123456797'),
    ('ACO123463', 'MAT123456798'),
    ('ACO123464', 'MAT123456799'),
    ('ACO123465', 'MAT123456800'),
    ('ENF002', 'MAT000123457'),
    ('ENF003', 'MAT000123458'),
    ('ENF004', 'MAT000123459'),
    ('ENF005', 'MAT000123460'),
    ('ENF006', 'MAT000123461'),
    ('ENF007', 'MAT000123462'),
    ('ENF008', 'MAT000123463'),
    ('ENF009', 'MAT000123464'),
    ('ENF010', 'MAT000123465'),
    ('PSC005', 'MAT001234580'),
    ('PSC006', 'MAT001234581'),
    ('PSC007', 'MAT001234582'),
    ('PSC008', 'MAT001234583'),
    ('PSC009', 'MAT001234584'),
    ('PSC010', 'MAT001234585'),
    ('PSC011', 'MAT001234586'),
    ('PSC012', 'MAT001234587');

INSERT INTO administrativo (legajo)
VALUES 
    ('ADM001'),
    ('ADM002'),
    ('ADM003'),
    ('ADM004'),
    ('ADM005'),
    ('ADM006'),
    ('ADM007'),
    ('ADM008'),
    ('ADM009'),
    ('ADM010');

INSERT INTO psiquiatra(legajo)
VALUES
    ('PSQ001'),
    ('PSQ002'),
    ('PSQ003'),
    ('PSQ004'),
    ('PSQ005'),
    ('PSQ006'),
    ('PSQ007'),
    ('PSQ008'),
    ('PSQ009'),
    ('PSQ010');
    
INSERT INTO acompanianteTerapeutico (legajo)
VALUES 
    ('ACO123456'),
    ('ACO123457'),
    ('ACO123458'),
    ('ACO123459'),
    ('ACO123460'),
    ('ACO123461'),
    ('ACO123462'),
    ('ACO123463'),
    ('ACO123464'),
    ('ACO123465');

INSERT INTO enfermera (legajo)
VALUES 
    ('ENF001'),
    ('ENF002'),
    ('ENF003'),
    ('ENF004'),
    ('ENF005'),
    ('ENF006'),
    ('ENF007'),
    ('ENF008'),
    ('ENF009'),
    ('ENF010');

INSERT INTO psicologo (legajo)
VALUES 
    ('PSC004'),
    ('PSC002'),
    ('PSC005'),
    ('PSC006'),
    ('PSC007'),
    ('PSC008'),
    ('PSC009'),
    ('PSC010'),
    ('PSC011'),
    ('PSC012');
    
INSERT INTO cargo(nombreCargo)
VALUES
    ('Director');

INSERT INTO asignado(fecha, legajo, nombreCargo)
VALUES
    ('2020-08-15', 'ADM002', 'Director');

INSERT INTO registroBaja(idRegistroBaja, fechaHora, motivo, legajoPersonal, legajoAdmin)
VALUES
    (1, '2024-08-29 14:30:00', 'Renuncia voluntaria', 'PSC002', 'ADM002');

INSERT INTO sot (fechaHora, motivoLlamado, observacionLlamado, dni, tipoDni, legajoAcompaniante)
VALUES 
    ('2024-08-29 14:30:00', 'Consulta de tratamiento', 'Paciente se siente mejor pero necesita ajustar la medicación.', '87654321', 'Pasaporte', 'ACO123456'),
    ('2023-01-10 10:30:00', 'Consulta general', 'Paciente solicita información sobre tratamiento.', '1234567890', 'DNI', 'ACO123456'),
    ('2023-01-15 15:45:00', 'Revisión médica', 'Paciente informa síntomas nuevos y solicita revisión médica.', '0987654321', 'DNI', 'ACO123456'),
    ('2023-02-01 09:20:00', 'Seguimiento', 'Se realiza seguimiento de tratamiento con evolución favorable.', '1122334455', 'PASAPORTE', 'ACO123456'),
    ('2023-02-10 13:00:00', 'Reagendar cita', 'Paciente solicita cambio de fecha de su próxima cita.', '1234567890', 'DNI', 'ACO123456'),
    ('2023-03-05 11:15:00', 'Medicación', 'Paciente pregunta sobre los efectos secundarios de la medicación.', '0987654321', 'DNI', 'ACO123456'),
    ('2023-03-15 17:50:00', 'Urgencia', 'Paciente presenta dolor severo y se procede con atención de urgencia.', '1122334455', 'PASAPORTE', 'ACO123456'),
    ('2023-04-01 14:30:00', 'Consulta médica', 'Paciente consulta sobre resultados de análisis recientes.', '1234567890', 'DNI', 'ACO123456'),
    ('2023-04-20 12:40:00', 'Evaluación psicológica', 'Paciente requiere evaluación psicológica debido a ansiedad.', '0987654321', 'DNI', 'ACO123456'),
    ('2023-05-10 08:55:00', 'Control de rutina', 'Paciente asiste para control de rutina, sin novedades.', '1122334455', 'PASAPORTE', 'ACO123456');

INSERT INTO turno (idTurno,estado, fechaHora, legajoProfesional, legajoAdmin)
VALUES 
    (1,'LIBRE', '2024-08-30 10:00:00', 'ACO123456', 'ADM001'),
    (2,'ATENDIDO', '2024-09-01 09:00:00', 'PSQ001', 'ADM001'),
    (3,'RESERVADO', '2023-01-10 10:00:00', 'ACO123456', 'ADM001'),
	(4,'ATENDIDO', '2023-01-15 14:30:00', 'PSQ001', 'ADM002'),
	(5,'CANCELADO', '2023-02-05 09:00:00', 'PSC003', 'ADM001'),
	(6,'LIBRE', '2023-02-20 11:00:00', 'ENF001', 'ADM002'),
	(7,'RESERVADO', '2023-03-01 08:00:00', 'PSC002', 'ADM001'),
	(8,'ATENDIDO', '2023-03-10 16:30:00', 'PSC004', 'ADM002'),
	(9,'LIBRE', '2023-04-05 10:15:00', 'ACO123456', 'ADM001'),
	(10,'CANCELADO', '2023-04-15 12:45:00','PSQ001', 'ADM002');

INSERT INTO solicita(idTurno,dni,tipoDni)
VALUES
    (1, '65432109', 'DNI'),
    (2, '12345678', 'DNI'),
    (3, '1234567890','DNI'),
    (4, '0987654321', 'DNI'),
    (5, '1122334455', 'PASAPORTE'),
    (7, '1234567890', 'DNI'),
    (8,  '0987654321', 'DNI'),
    (10, '0987654111', 'DNI');
    

INSERT INTO eje (codigoEje, descripcionEje)
VALUES 
    (1, 'Descripción del Eje 1'),
    (2, 'Descripcion del Eje 2'),
    (3, 'Descripcion del Eje 3'),
    (4, 'Descripcion del Eje 4'),
    (5, 'Descripcion del Eje 5');

INSERT INTO nomenclador (codigoNomenclador, descripcion, codigoEje)
VALUES 
    (3, 'Descripción Nomenclador 3', 1),
    (4, 'Descripción Nomenclador 4', 2),
    (1, 'Descripción Nomenclador 1', 1),
    (2, 'Descripción Nomenclador 2', 1),
    (3, 'Descripción Nomenclador 3', 2),
    (4, 'Descripción Nomenclador 4', 1),
    (5, 'Descripción Nomenclador 5', 3),
    (6, 'Descripción Nomenclador 6', 4),
    (7, 'Descripción Nomenclador 7', 5);

INSERT INTO diagnosticoMultiaxial (idDiagnostico,estado)
VALUES 
    (1,'Estado 1'),
    (2,'Estado 2'),
    (3,'Estado 3'),
    (4,'Estado 4'),
    (5, 'Estado 1'),
    (6, 'Estado 2'),
    (7, 'Estado 3'),
    (8, 'Estado 4'),
    (9, 'Estado 5'),
    (10, 'Estado 6');

INSERT INTO contiene (idDiagnostico, codigoNomenclador, codigoEje)
VALUES 
    (1, 3, 1),
    (2, 4, 2),
    (3, 3, 1),
    (4, 4, 1),
    (5, 1, 1),
    (5, 2, 1),
    (6, 5, 3),
    (6, 6, 4),
    (7, 7, 5),
    (8, 2, 1);

INSERT INTO evolucion (numeroEvolucion,dni, tipoDni, estado, motivoOcultado, fechaHora, descripcion, legajoProfesional, idDiagnostico)
VALUES 
    (1,'78901234', 'Cédula', 'Estable', 'N/A', '2024-08-29 09:00:00', 'El paciente muestra mejoras en su condición general y sigue el plan de tratamiento.', 'ACO123456', 1),
    (2,'65432109', 'DNI', 'Mejorando', 'N/A', '2024-08-30 10:30:00', 'Paciente presenta mejoría en su estado general y se ajusta la medicación.', 'PSQ001', 2),
    (3,'11223344', 'DNI', 'Estable', 'N/A', '2024-08-30 11:00:00', 'Paciente estable, se continúa tratamiento intensivo.', 'ENF001', 3),
    (4,'22334455', 'DNI', 'Inestable', 'N/A', '2024-08-30 12:00:00', 'Paciente presenta episodios de ansiedad, se ajustará medicación.', 'PSQ001', 4),
    (5, '1234567890', 'DNI', 'En tratamiento', NULL, '2023-01-10 10:00:00', 'Paciente muestra mejora en los síntomas.', 'PSQ001', 5),
    (6, '1234567890', 'DNI', 'Estable', NULL, '2023-02-01 14:30:00', 'Control de rutina, sin novedades.', 'PSC002', 6),
    (7, '0987654321', 'DNI', 'Pendiente', 'Motivo oculto', '2023-01-15 09:00:00', 'Paciente solicita una segunda opinión.', 'PSC003', 7),
    (8, '0987654321', 'DNI', 'Mejorado', NULL, '2023-03-10 16:00:00', 'Paciente presenta mejoría significativa.', 'PSC004', 8),
    (9, '1122334455', 'PASAPORTE', 'En seguimiento', NULL, '2023-02-20 11:15:00', 'Seguimiento del tratamiento con evolución positiva.', 'ENF001', 9),
    (10, '1122334455', 'PASAPORTE', 'Estable', NULL, '2023-04-05 10:30:00', 'Control rutinario con buenos resultados.', 'PSQ001', 10);

INSERT INTO recetaMedica(idReceta, fecha,descripcion,estado,legajoPsiquiatra, numeroEvolucion,dni,tipoDni)
VALUES
    ('20315463', '2024-08-30', 'Tiene que tomar 50mg de Sertralina por dia', 'AUTORIZADO', 'PSQ001', 2, '65432109', 'DNI'),
    ('20315464', '2024-08-30', 'Se ajusta la dosis de Sertralina a 100mg por día.', 'ASIGNADO', 'PSQ001', 3, '11223344', 'DNI'),
    ('20315465', '2024-08-30', 'Paciente requiere 20mg de Diazepam antes de dormir.', 'NO AUTORIZADO', 'PSQ001', 4, '22334455', 'DNI');

INSERT INTO medicamento(idMedicamento,nombre,dosis,tipo)
VALUES
    (132153,'Sertralina', 50, 'Comprimido'),
    (132154, 'Diazepam', 20, 'Comprimido'),
    (132155, 'Sertralina', 100, 'Comprimido');

INSERT INTO stock(fecha,cantidad,idMedicamento)
VALUES
    ('2024-02-12',5,132153),
    ('2024-03-15', 10, 132154),
    ('2024-03-15', 8, 132155);

INSERT INTO requiereDe(dosis,frecuencia,idReceta,idMedicamento)
VALUES
    (50,'24hs','20315463', 132153),
    (100, '24hs', '20315464', 132155),
    (20, '24hs', '20315465', 132154);

INSERT INTO entregaMedicamento(idEntrega, fechaHora, dosis, legajoEnfermera, idReceta, idMedicamento, dni, tipoDni)
VALUES
    (1, '2024-08-30 11:00:00', '50mg', 'ENF001', 20315463, 132153, '65432109', 'DNI'),
    (2, '2024-08-30 13:00:00', '100mg', 'ENF001', 20315464, 132155, '11223344', 'DNI'),
    (3, '2024-08-30 14:00:00', '20mg', 'ENF001', 20315465, 132154, '22334455', 'DNI');
