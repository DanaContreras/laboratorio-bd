INSERT INTO paciente (dni, tipoDni, nombre, apellido, obraSocial, fechaNac, fechaIngreso, foto)
VALUES 
('12345678', 'DNI', 'Juan', 'Pérez', 'OSDE', '1985-04-12', '2023-08-01', 'https://example.com/foto1.jpg'),
('87654321', 'Pasaporte', 'María', 'Gómez', 'Swiss Medical', '1990-06-22', '2024-01-15', 'https://example.com/foto2.jpg'),
('34567890', 'DNI', 'Carlos', 'López', 'Galeno', '1980-12-30', '2022-11-10', 'https://example.com/foto3.jpg'),
('65432109', 'DNI', 'Lucía', 'Martínez', 'OSDE', '1995-09-15', '2021-03-23', 'https://example.com/foto4.jpg'),
('78901234', 'Cédula', 'Roberto', 'Fernández', 'Medifé', '1978-07-05', '2023-07-01', 'https://example.com/foto5.jpg');

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
('AC123456', 'Ana', 'Martínez', 'password123', '1985-05-15', 'https://example.com/fotoPerfil.jpg', 'ana.martinez@example.com', 'Activo'),
('ADM001', 'Ana', 'Gómez', 'adminpass', '1985-05-22', 'foto2.jpg', 'ana.gomez@example.com', 'Activo');

INSERT INTO profesional (legajo, matricula)
VALUES 
('AC123456', 'MAT123456789');

INSERT INTO acompanianteTerapeutico (legajo)
VALUES 
('AC123456');

INSERT INTO sot (fechaHora, motivoLlamado, observacionLlamado, dni, tipoDni, legajoAcompaniante)
VALUES 
('2024-08-29 14:30:00', 'Consulta de tratamiento', 'Paciente se siente mejor pero necesita ajustar la medicación.', '87654321', 'Pasaporte', 'AC123456');


-- relacion de un paciente con un turno

INSERT INTO administrativo (legajo)
VALUES ('ADM001');

INSERT INTO turno (estado, fechaHora, dni, tipoDni, legajoProfesional, legajoAdmin)
VALUES 
    ('Libre', '2024-08-30 10:00:00', '65432109', 'DNI', 'AC123456', 'ADM001');

-- relación de un paciente con una evolucion

INSERT INTO eje (codigoEje, descripcionEje)
VALUES 
    ('EJE1', 'Descripción del Eje 1');

INSERT INTO nomenclador (codigoNomenclador, descripcion, codigoEje)
VALUES 
    ('NOM3', 'Descripción Nomenclador 3', 'EJE1');

INSERT INTO diagnosticoMultiaxial (estado)
VALUES 
    ('Estado 1');
    
    
-- Esta parte del script hay que hacerla manualmente
SELECT idDiagnostico
FROM diagnosticomultiaxial
    
-- Resultado idDiagnostico 15

INSERT INTO contiene (idDiagnostico, codigoNomenclador, codigoEje)
VALUES 
    (15, 'NOM3', 'EJE1');
   
INSERT INTO evolucion (dni, tipoDni, estado, motivoOcultado, fechaHora, descripcion, legajoProfesional, idDiagnostico)
VALUES 
('78901234', 'Cédula', 'Estable', 'N/A', '2024-08-29 09:00:00', 'El paciente muestra mejoras en su condición general y sigue el plan de tratamiento.', 'AC123456', 15);
