INSERT INTO paciente (dni, tipoDni, nombre, apellido, obraSocial, fechaNac, fechaIngreso, foto)
VALUES 
('12345678', 'DNI', 'Juan', 'Pérez', 'OSDE', '1985-04-12', '2023-08-01', 'https://example.com/foto1.jpg'),
('87654321', 'Pasaporte', 'María', 'Gómez', 'Swiss Medical', '1990-06-22', '2024-01-15', 'https://example.com/foto2.jpg'),
('34567890', 'DNI', 'Carlos', 'López', 'Galeno', '1980-12-30', '2022-11-10', 'https://example.com/foto3.jpg'),
('65432109', 'DNI', 'Lucía', 'Martínez', 'OSDE', '1995-09-15', '2021-03-23', 'https://example.com/foto4.jpg'),
('78901234', 'Cédula', 'Roberto', 'Fernández', 'Medifé', '1978-07-05', '2023-07-01', 'https://example.com/foto5.jpg');

INSERT INTO tratamientoGravedad (idTratamiento, gravedad, frecuencia)
VALUES 
('TRT001', 'Grave intensivo', 'Diaria'),
('TRT002', 'Ambulatorio', 'Semanal');

-- relacion de un paciente con un tratamiento.
INSERT INTO recibe (fechaInicio, fechaFin, dni, tipoDni, idTratamiento)
VALUES  --
('2024-01-10', '2024-03-10', '12345678', 'DNI', 'TRT001');

-- relacion de un paciente con un sot
INSERT INTO sot (fecha, hora, motivoLlamado, observacionLlamado, dni, tipoDni, legajoAcompaniante)
VALUES 
('2024-08-29', '14:30:00', 'Consulta de tratamiento', 'Paciente se siente mejor pero necesita ajustar la medicación.', '87654321', 'Pasaporte', 'AC123456');

INSERT INTO acompanianteTerapeutico (legajo)
VALUES 
('AC123456');

INSERT INTO profesional (legajo, matricula)
VALUES 
('AC123456', 'MAT123456789');

INSERT INTO personalClinico (legajo, nombre, apellido, contrasenia, fechaNac, fotoPerfil, email, estado)
VALUES 
('AC123456', 'Ana', 'Martínez', 'password123', '1985-05-15', 'https://example.com/fotoPerfil.jpg', 'ana.martinez@example.com', 'Activo');

INSERT INTO evolucion (dni, tipoDni, estado, motivoOcultado, hora, fecha, descripcion, legajoProfesional)
VALUES 
('78901234', 'Cédula', 'Estable', 'N/A', '09:00:00', '2024-08-29', 'El paciente muestra mejoras en su condición general y sigue el plan de tratamiento.', 'AC123456');
