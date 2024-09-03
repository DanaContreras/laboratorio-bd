INSERT INTO paciente (dni, tipoDni, nombre, apellido, obraSocial, fechaNac, fechaIngreso, foto)
VALUES 
('12345678', 'DNI', 'Juan', 'Pérez', 'OSDE', '1985-04-12', '2023-08-01', 'https://example.com/foto1.jpg'),
('87654321', 'Pasaporte', 'María', 'Gómez', 'Swiss Medical', '1990-06-22', '2024-01-15', 'https://example.com/foto2.jpg'),
('34567890', 'DNI', 'Carlos', 'López', 'Galeno', '1980-12-30', '2022-11-10', 'https://example.com/foto3.jpg'),
('65432109', 'DNI', 'Lucía', 'Martínez', 'OSDE', '1995-09-15', '2021-03-23', 'https://example.com/foto4.jpg'),
('78901234', 'Cédula', 'Roberto', 'Fernández', 'Medifé', '1978-07-05', '2023-07-01', 'https://example.com/foto5.jpg'),
('11223344', 'DNI', 'Jorge', 'Ramírez', 'OSDE', '1983-08-15', '2024-01-02', 'https://example.com/fotoJorge.jpg'),
('22334455', 'DNI', 'Ana', 'Suárez', 'Galeno', '1991-05-23', '2024-02-10', 'https://example.com/fotoAna.jpg');

-- relacion de un paciente con un tratamiento.

INSERT INTO tratamientoGravedad (idTratamiento, gravedad, frecuencia)
VALUES 
('TRT001', 'Grave intensivo', 'DIA COMPLETO'),
('TRT002', 'Ambulatorio', 'SEMANAL');

INSERT INTO recibe (fechaInicio, fechaFin, dni, tipoDni, idTratamiento)
VALUES  --
('2024-01-10', '2024-03-10', '12345678', 'DNI', 'TRT001');

-- relacion de un paciente con un sot

INSERT INTO personalClinico (legajo, nombre, apellido, contrasenia, fechaNac, fotoPerfil, email, estado)
VALUES 
('ACO123456', 'Ana', 'Martínez', 'password123', '1985-05-15', 'https://example.com/fotoPerfil.jpg', 'ana.martinez@example.com', 'Activo'),
('ADM001', 'Ana', 'Gómez', 'adminpass', '1985-05-22', 'foto2.jpg', 'ana.gomez@example.com', 'Activo'),
('PSQ001', 'Javier', 'Sánchez', 'password456', '1995-02-20', 'https://example.com/fotoPerfilJavier.jpg', 'javier.sanchez@example.com', 'Activo'),
('PSC003', 'Clara', 'Rodríguez', 'password789', '1975-11-25', 'https://example.com/fotoPerfilClara.jpg', 'clara.rodriguez@example.com', 'Activo'),
('ENF001', 'Laura', 'González', 'password321', '1987-03-14', 'https://example.com/fotoLaura.jpg', 'laura.gonzalez@example.com', 'Activo'),
('PSC002', 'Luis', 'Martínez', 'password654', '1992-11-30', 'https://example.com/fotoLuis.jpg', 'luis.martinez@example.com', 'Baja');

INSERT INTO profesional (legajo, matricula)
VALUES 
('ACO123456', 'MAT123456789'),
('PSQ001', 'MAT001234569'),
('PSC003', 'MAT001234570'),
('ENF001', 'MAT000123456'),
('PSC002', 'MAT000654321');

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
('PSC002');

INSERT INTO sot (fechaHora, motivoLlamado, observacionLlamado, dni, tipoDni, legajoAcompaniante)
VALUES 
('2024-08-29 14:30:00', 'Consulta de tratamiento', 'Paciente se siente mejor pero necesita ajustar la medicación.', '87654321', 'Pasaporte', 'ACO123456');


-- relacion de un paciente con un turno

INSERT INTO administrativo (legajo)
VALUES ('ADM001');

INSERT INTO turno (estado, fechaHora, dni, tipoDni, legajoProfesional, legajoAdmin)
VALUES 
    ('Libre', '2024-08-30 10:00:00', '65432109', 'DNI', 'ACO123456', 'ADM001');

-- relación de un paciente con una evolucion

INSERT INTO eje (codigoEje, descripcionEje)
VALUES 
    ('EJE1', 'Descripción del Eje 1'),
    ('EJE2', 'Descripcion del Eje 2');

INSERT INTO nomenclador (codigoNomenclador, descripcion, codigoEje)
VALUES 
    ('NOM3', 'Descripción Nomenclador 3', 'EJE1'),
    ('NOM4','Descripción Nomenclador 4','EJE2');

INSERT INTO diagnosticoMultiaxial (estado)
VALUES 
    ('Estado 1'),
    ('Estado 2'),
    ('Estado 3'),
    ('Estado 4');
    
    
-- Esta parte del script hay que hacerla manualmente
SELECT idDiagnostico
FROM diagnosticomultiaxial
    
-- Resultado idDiagnostico 15

INSERT INTO contiene (idDiagnostico, codigoNomenclador, codigoEje)
VALUES 
    (1, 'NOM3', 'EJE1'),
    (2,'NOM4','EJE2'),
    (3, 'NOM3', 'EJE1'),
    (4, 'NOM4', 'EJE2');

INSERT INTO evolucion (dni, tipoDni, estado, motivoOcultado, fechaHora, descripcion, legajoProfesional, idDiagnostico)
VALUES 
('78901234', 'Cédula', 'Estable', 'N/A', '2024-08-29 09:00:00', 'El paciente muestra mejoras en su condición general y sigue el plan de tratamiento.', 'ACO123456', 1),
('65432109', 'DNI', 'Mejorando', 'N/A', '2024-08-30 10:30:00', 'Paciente presenta mejoría en su estado general y se ajusta la medicación.', 'PSQ001', 2),
('11223344', 'DNI', 'Estable', 'N/A', '2024-08-30 11:00:00', 'Paciente estable, se continúa tratamiento intensivo.', 'ENF001', 3),
('22334455', 'DNI', 'Inestable', 'N/A', '2024-08-30 12:00:00', 'Paciente presenta episodios de ansiedad, se ajustará medicación.', 'PSQ001', 4);

-- Obtener el número de evolución generado (asumimos que es 6 para este ejemplo)
-- SELECT MAX(numeroEvolucion) AS numeroEvolucion FROM evolucion WHERE dni = '65432109' AND tipoDni = 'DNI';
--HAY Q VERIFICARLO PARA CADA RECETA MANUALEMENTE

INSERT INTO recetaMedica(idReceta, fecha,descripcion,estado,legajoPsiquiatra, numeroEvolucion,dni,tipoDni)
VALUES
('20315463', '2024-08-30', 'Tiene que tomar 50mg de Sertralina por dia', 'AUTORIZADO', 'PSQ001', 6, '65432109', 'DNI'),
('20315464', '2024-08-30', 'Se ajusta la dosis de Sertralina a 100mg por día.', 'ASIGNADO', 'PSQ001', 7, '11223344', 'DNI'),
('20315465', '2024-08-30', 'Paciente requiere 20mg de Diazepam antes de dormir.', 'NO AUTORIZADO', 'PSQ001', 8, '22334455', 'DNI');

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
