/*
Para eliminar todos los datos de las tablas:
DO $$ 
DECLARE
    r RECORD;
BEGIN
    FOR r IN (SELECT tablename FROM pg_tables WHERE schemaname = 'public') 
    LOOP
        EXECUTE 'TRUNCATE TABLE ' || r.tablename || ' RESTART IDENTITY CASCADE';
    END LOOP;
END $$;
*/

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
    ('1122334455', 'PASAPORTE', 'Carlos', 'Ramírez', 'Medifé', '1978-12-02', '2023-03-20', 'https://example.com/foto3.jpg');

INSERT INTO tratamientoGravedad (idTratamiento, gravedad, frecuencia)
VALUES 
    ('TRT001', 'Grave intensivo', 'DIA COMPLETO'),
    ('TRT002', 'Ambulatorio', 'SEMANAL'),
    ('T001', 'Grave intensivo', 'DIA COMPLETO'),
    ('T002', 'Grave medianamente intensivo', 'SEMANAL'),
    ('T003', 'Ambulatorio', 'MENSUAL'),
    ('T004', 'Grave intensivo', 'DIA COMPLETO'),
    ('T005', 'Grave intensivo', 'SEMANAL'),
    ('T006', 'Ambulatorio', 'DIA COMPLETO'),
    ('T007', 'Grave medianamente intensivo', 'QUINCENAL'),
    ('T008', 'Ambulatorio', 'MENSUAL');

INSERT INTO recibe (fechaInicio, fechaFin, dni, tipoDni, idTratamiento)
VALUES  --
    ('2024-01-10', '2024-03-10', '12345678', 'DNI', 'TRT001'),
    ('2023-01-15', '2023-02-15', '1234567890', 'DNI', 'T001'),
    ('2023-03-01', '2023-04-01', '1234567890', 'DNI', 'T003'),
    ('2023-01-20', '2023-02-20', '0987654321', 'DNI', 'T002'),
    ('2023-04-01', '2023-05-01', '0987654321', 'DNI', 'T004'),
    ('2023-03-15', '2023-04-15', '0987654321', 'DNI', 'T005'),
    ('2023-02-10', '2023-03-10', '1122334455', 'PASAPORTE', 'T006'),
    ('2023-04-05', '2023-05-05', '1122334455', 'PASAPORTE', 'T007'),
    ('2023-05-01', '2023-06-01', '1122334455', 'PASAPORTE', 'T008'),
    ('2023-06-10', '2023-07-10', '1234567890', 'DNI', 'T008');

INSERT INTO personalClinico (legajo, nombre, apellido, contrasenia, fechaNac, fotoPerfil, email, estado)
VALUES 
    ('ACO123456', 'Ana', 'Martínez', 'password123', '1985-05-15', 'https://example.com/fotoPerfil.jpg', 'ana.martinez@example.com', 'ACTIVO'),
    ('ADM001', 'Ana', 'Gómez', 'adminpass', '1985-05-22', 'foto2.jpg', 'ana.gomez@example.com', 'ACTIVO'),
    ('PSQ001', 'Javier', 'Sánchez', 'password456', '1995-02-20', 'https://example.com/fotoPerfilJavier.jpg', 'javier.sanchez@example.com', 'ACTIVO'),
    ('PSC003', 'Clara', 'Rodríguez', 'password789', '1975-11-25', 'https://example.com/fotoPerfilClara.jpg', 'clara.rodriguez@example.com', 'ACTIVO'),
    ('ENF001', 'Laura', 'González', 'password321', '1987-03-14', 'https://example.com/fotoLaura.jpg', 'laura.gonzalez@example.com', 'ACTIVO'),
    ('PSC002', 'Luis', 'Martínez', 'password654', '1992-11-30', 'https://example.com/fotoLuis.jpg', 'luis.martinez@example.com', 'BAJA'),
    ('PSC004', 'María', 'Pérez', 'securepass123', '1990-06-12', 'https://example.com/fotoMaria.jpg', 'maria.perez@example.com', 'ACTIVO'),
    ('ADM002', 'Carlos', 'Fernández', 'adminsecure789', '1988-08-05', 'https://example.com/fotoCarlos.jpg', 'carlos.fernandez@example.com', 'ACTIVO');

INSERT INTO profesional (legajo, matricula)
VALUES 
    ('ACO123456', 'MAT123456789'),
    ('PSQ001', 'MAT001234569'),
    ('PSC003', 'MAT001234570'),
    ('ENF001', 'MAT000123456'),
    ('PSC002', 'MAT000654321'),
    ('PSC004', 'MAT000894546');

INSERT INTO administrativo (legajo)
VALUES 
    ('ADM001'),
    ('ADM002');

INSERT INTO psiquiatra(legajo)
VALUES
    ('PSQ001');

INSERT INTO acompanianteTerapeutico (legajo)
VALUES 
    ('ACO123456');

INSERT INTO enfermera (legajo)
VALUES 
    ('ENF001');

INSERT INTO psicologo (legajo)
VALUES 
    ('PSC004'),
    ('PSC002');

INSERT INTO cargo(nombreCargo)
VALUES
    ('Director');

INSERT INTO asignado(fecha, legajo, nombreCargo)
VALUES
    ('2020-08-15', 'ADM002', 'Director');

INSERT INTO registroBaja(idRegistroBaja, fechaHora, motivo, legajoPersonal, legajoAdmin)
VALUES
    ('Baja-1', '2024-08-29 14:30:00', 'Renuncia voluntaria', 'PSC002', 'ADM002');

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

INSERT INTO turno (estado, fechaHora, dni, tipoDni, legajoProfesional, legajoAdmin)
VALUES 
    ('LIBRE', '2024-08-30 10:00:00', '65432109', 'DNI', 'ACO123456', 'ADM001'),
    ('ATENDIDO', '2024-09-01 09:00:00', '12345678', 'DNI', 'PSQ001', 'ADM001'),
    ('RESERVADO', '2023-01-10 10:00:00', '1234567890', 'DNI', 'ACO123456', 'ADM001'),
	('ATENDIDO', '2023-01-15 14:30:00', '0987654321', 'DNI', 'PSQ001', 'ADM002'),
	('CANCELADO', '2023-02-05 09:00:00', '1122334455', 'PASAPORTE', 'PSC003', 'ADM001'),
	('LIBRE', '2023-02-20 11:00:00', NULL, NULL, 'ENF001', 'ADM002'),
	('RESERVADO', '2023-03-01 08:00:00', '1234567890', 'DNI', 'PSC002', 'ADM001'),
	('ATENDIDO', '2023-03-10 16:30:00', '0987654321', 'DNI', 'PSC004', 'ADM002'),
	('LIBRE', '2023-04-05 10:15:00', NULL, NULL, 'ACO123456', 'ADM001'),
	('CANCELADO', '2023-04-15 12:45:00', '1122334455', 'PASAPORTE', 'PSQ001', 'ADM002');

INSERT INTO eje (codigoEje, descripcionEje)
VALUES 
    ('EJE1', 'Descripción del Eje 1'),
    ('EJE2', 'Descripcion del Eje 2'),
    ('EJE3', 'Descripcion del Eje 3'),
    ('EJE4', 'Descripcion del Eje 4'),
    ('EJE5', 'Descripcion del Eje 5');

INSERT INTO nomenclador (codigoNomenclador, descripcion, codigoEje)
VALUES 
    ('NOM3', 'Descripción Nomenclador 3', 'EJE1'),
    ('NOM4', 'Descripción Nomenclador 4', 'EJE2'),
    ('NOM1', 'Descripción Nomenclador 1', 'EJE1'),
    ('NOM2', 'Descripción Nomenclador 2', 'EJE1'),
    ('NOM3', 'Descripción Nomenclador 3', 'EJE2'),
    ('NOM4', 'Descripción Nomenclador 4', 'EJE1'),
    ('NOM5', 'Descripción Nomenclador 5', 'EJE3'),
    ('NOM6', 'Descripción Nomenclador 6', 'EJE4'),
    ('NOM7', 'Descripción Nomenclador 7', 'EJE5');

INSERT INTO diagnosticoMultiaxial (idDiagnostico,estado)
VALUES 
    ('Dig-1','Estado 1'),
    ('Dig-2','Estado 2'),
    ('Dig-3','Estado 3'),
    ('Dig-4','Estado 4'),
    ('Dig-5', 'Estado 1'),
	('Dig-6', 'Estado 2'),
	('Dig-7', 'Estado 3'),
	('Dig-8', 'Estado 4'),
	('Dig-9', 'Estado 5'),
	('Dig-10', 'Estado 6');

INSERT INTO contiene (idDiagnostico, codigoNomenclador, codigoEje)
VALUES 
    ('Dig-1', 'NOM3', 'EJE1'),
    ('Dig-2', 'NOM4', 'EJE2'),
    ('Dig-3', 'NOM3', 'EJE1'),
    ('Dig-4', 'NOM4', 'EJE1'),
    ('Dig-5', 'NOM1', 'EJE1'),
    ('Dig-5', 'NOM2', 'EJE1'),
    ('Dig-6', 'NOM5', 'EJE3'),
    ('Dig-6', 'NOM6', 'EJE4'),
    ('Dig-7', 'NOM7', 'EJE5'),
    ('Dig-8', 'NOM2', 'EJE1');

INSERT INTO evolucion (numeroEvolucion,dni, tipoDni, estado, motivoOcultado, fechaHora, descripcion, legajoProfesional, idDiagnostico)
VALUES 
	('EV-1','78901234', 'Cédula', 'Estable', 'N/A', '2024-08-29 09:00:00', 'El paciente muestra mejoras en su condición general y sigue el plan de tratamiento.', 'ACO123456', 'Dig-1'),
	('EV-2','65432109', 'DNI', 'Mejorando', 'N/A', '2024-08-30 10:30:00', 'Paciente presenta mejoría en su estado general y se ajusta la medicación.', 'PSQ001', 'Dig-2'),
	('EV-3','11223344', 'DNI', 'Estable', 'N/A', '2024-08-30 11:00:00', 'Paciente estable, se continúa tratamiento intensivo.', 'ENF001', 'Dig-3'),
	('EV-4','22334455', 'DNI', 'Inestable', 'N/A', '2024-08-30 12:00:00', 'Paciente presenta episodios de ansiedad, se ajustará medicación.', 'PSQ001', 'Dig-4'),
	('EVO001', '1234567890', 'DNI', 'En tratamiento', NULL, '2023-01-10 10:00:00', 'Paciente muestra mejora en los síntomas.', 'PSQ001', 'Dig-5'),
    ('EVO002', '1234567890', 'DNI', 'Estable', NULL, '2023-02-01 14:30:00', 'Control de rutina, sin novedades.', 'PSC002', 'Dig-6'),
    ('EVO003', '0987654321', 'DNI', 'Pendiente', 'Motivo oculto', '2023-01-15 09:00:00', 'Paciente solicita una segunda opinión.', 'PSC003', 'Dig-7'),
    ('EVO004', '0987654321', 'DNI', 'Mejorado', NULL, '2023-03-10 16:00:00', 'Paciente presenta mejoría significativa.', 'PSC004', 'Dig-8'),
    ('EVO005', '1122334455', 'PASAPORTE', 'En seguimiento', NULL, '2023-02-20 11:15:00', 'Seguimiento del tratamiento con evolución positiva.', 'ENF001', 'Dig-9'),
    ('EVO006', '1122334455', 'PASAPORTE', 'Estable', NULL, '2023-04-05 10:30:00', 'Control rutinario con buenos resultados.', 'PSQ001', 'Dig-10');

INSERT INTO recetaMedica(idReceta, fecha,descripcion,estado,legajoPsiquiatra, numeroEvolucion,dni,tipoDni)
VALUES
    ('20315463', '2024-08-30', 'Tiene que tomar 50mg de Sertralina por dia', 'AUTORIZADO', 'PSQ001', 'EV-2', '65432109', 'DNI'),
    ('20315464', '2024-08-30', 'Se ajusta la dosis de Sertralina a 100mg por día.', 'ASIGNADO', 'PSQ001', 'EV-3', '11223344', 'DNI'),
    ('20315465', '2024-08-30', 'Paciente requiere 20mg de Diazepam antes de dormir.', 'NO AUTORIZADO', 'PSQ001', 'EV-4', '22334455', 'DNI');

INSERT INTO medicamento(idMedicamento,nombre,dosis,tipo)
VALUES
    ('132153','Sertralina', 50, 'Comprimido'),
    ('132154', 'Diazepam', 20, 'Comprimido'),
    ('132155', 'Sertralina', 100, 'Comprimido');

INSERT INTO stock(fecha,cantidad,idMedicamento)
VALUES
    ('2024-02-12',5,'132153'),
    ('2024-03-15', 10, '132154'),
    ('2024-03-15', 8, '132155');

INSERT INTO requiereDe(dosis,frecuencia,idReceta,idMedicamento)
VALUES
    (50,'24hs','20315463', '132153'),
    (100, '24hs', '20315464', '132155'),
    (20, '24hs', '20315465', '132154');

INSERT INTO entregaMedicamento(idEntrega, fechaHora, dosis, legajoEnfermera, idReceta, idMedicamento, dni, tipoDni)
VALUES
    (1, '2024-08-30 11:00:00', '50mg', 'ENF001', 20315463, 132153, '65432109', 'DNI'),
    (2, '2024-08-30 13:00:00', '100mg', 'ENF001', 20315464, 132155, '11223344', 'DNI'),
    (3, '2024-08-30 14:00:00', '20mg', 'ENF001', 20315465, 132154, '22334455', 'DNI');
