/* TO-DO:
	- ver tema de politicas si son adecuadas
	- ver opciones de los estados
*/

/*DROP TABLE IF EXISTS personalClinico;
DROP TABLE IF EXISTS administrativo;
DROP TABLE IF EXISTS profesional;
DROP TABLE IF EXISTS acompanianteTerapeutico;
DROP TABLE IF EXISTS enfermera;
DROP TABLE IF EXISTS psicologo;
DROP TABLE IF EXISTS psiquiatra;
DROP TABLE IF EXISTS registroBaja;
DROP TABLE IF EXISTS cargo;
DROP TABLE IF EXISTS asignado;
*/

CREATE TABLE personalClinico (
	legajo VARCHAR(15) PRIMARY KEY,
	nombre VARCHAR(50),
	apellido VARCHAR(50),
	contrasenia VARCHAR(50) NOT NULL,
	fechaNac DATE,
	fotoPerfil TEXT,
	email VARCHAR(255) NOT NULL,
	estado VARCHAR(6) NOT NULL CHECK (estado IN ('Activo', 'Baja'))
);

CREATE TABLE administrativo (
	legajo VARCHAR(15) PRIMARY KEY,
	FOREIGN KEY (legajo) REFERENCES personalClinico (legajo) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE profesional (
	legajo VARCHAR(15) PRIMARY KEY,
	matricula VARCHAR(20) NOT NULL,
	FOREIGN KEY (legajo) REFERENCES personalClinico (legajo) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE acompanianteTerapeutico (
	legajo VARCHAR(15) PRIMARY KEY,
	FOREIGN KEY (legajo) REFERENCES profesional (legajo) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE enfermera (
	legajo VARCHAR(15) PRIMARY KEY,
	FOREIGN KEY (legajo) REFERENCES profesional (legajo) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE psiquiatra (
	legajo VARCHAR(15) PRIMARY KEY,
	FOREIGN KEY (legajo) REFERENCES profesional (legajo) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE psicologo (
	legajo VARCHAR(15) PRIMARY KEY,
	FOREIGN KEY (legajo) REFERENCES profesional (legajo) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE registroBaja (
	idRegistroBaja SERIAL PRIMARY KEY,
	fecha DATE NOT NULL,
	hora TIME NOT NULL,
	motivo VARCHAR(100) NOT NULL,
	legajoPersonal VARCHAR(15) NOT NULL,
	legajoAdmin VARCHAR(15) NOT NULL,
	FOREIGN KEY (legajoPersonal) REFERENCES personalClinico (legajo) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (legajoAdmin) REFERENCES administrativo (legajo) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE cargo (
	nombreCargo VARCHAR(50) PRIMARY KEY
);

CREATE TABLE asignado (
	fecha DATE,
	legajo VARCHAR(15),
	nombreCargo VARCHAR(50),
	PRIMARY KEY (fecha, legajo),
	FOREIGN KEY (legajo) REFERENCES administrativo (legajo) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (nombreCargo) REFERENCES cargo (nombreCargo) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE paciente (
	dni VARCHAR(10) PRIMARY KEY,
	nombre VARCHAR(50),
	apellido VARCHAR(50),
	obraSocial VARCHAR(30),
	fechaNac DATE,
	fechaIngreso DATE NOT NULL,
	foto TEXT
);

CREATE TABLE evolucion (
	numeroEvolucion SERIAL,
	dni VARCHAR(10),
	estado VARCHAR(50),
	motivoOcultado VARCHAR(50), 
	hora TIME,
	fecha DATE,
	descripcion VARCHAR(200),
	legajoProfesional VARCHAR(15),
	PRIMARY KEY (numeroEvolucion, dni),
	FOREIGN KEY (dni) REFERENCES paciente (dni) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (legajoProfesional) REFERENCES profesional (legajo) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE tratamientoGravedad (
	idTratamiento VARCHAR(20) PRIMARY KEY,
	gravedad VARCHAR(30) NOT NULL CHECK (gravedad IN ('Grave intensivo', 'Grave medianamente intensivo', 'Ambulatorio')), -- VER
	frecuencia VARCHAR(10) NOT NULL CHECK (frecuencia IN ('Diaria', 'Semanal', 'Quincenal', 'Mensual'))
);

CREATE TABLE recibe (
	fechaInicio DATE,
	fechaFin DATE,
	dni VARCHAR(10),
	idTratamiento VARCHAR(20),
	PRIMARY KEY(fechaInicio, fechaFin),
	FOREIGN KEY (idTratamiento) REFERENCES tratamientoGravedad (idTratamiento) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE diagnosticoMultiaxial (
	idDiagnostico SERIAL PRIMARY KEY,
	estado VARCHAR(30)
);

CREATE TABLE eje (
	codigoEje VARCHAR(20) PRIMARY KEY,
	descripcionEje VARCHAR(500)
);

CREATE TABLE nomenclador (
	codigoNomenclador VARCHAR(20),
	descripcion VARCHAR(500),
	codigoEje VARCHAR(20),
	PRIMARY KEY(codigoNomenclador, codigoEje),
	FOREIGN KEY (codigoEje) REFERENCES eje (codigoEje) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE contiene (
	idDiagnostico INT,
	codigoNomenclador VARCHAR(20),
	codigoEje VARCHAR(20),
	PRIMARY KEY(idDiagnostico, codigoNomenclador, codigoEje),
	FOREIGN KEY (idDiagnostico) REFERENCES diagnosticoMultiaxial (idDiagnostico) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (codigoNomenclador, codigoEje) REFERENCES nomenclador (codigoNomenclador, codigoEje) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE turno (
	idTurno SERIAL PRIMARY KEY,
	estado VARCHAR(30) NOT NULL CHECK (estado IN ('Libre', 'Reservado', 'Cancelado', 'Atendido')),
	hora TIME NOT NULL,
	fecha DATE NOT NULL,
	dni VARCHAR(10),
	legajoProfesional VARCHAR(15),
	legajoAdmin VARCHAR(15),
	FOREIGN KEY (dni) REFERENCES paciente (dni) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (legajoProfesional) REFERENCES profesional (legajo) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (legajoAdmin) REFERENCES administrativo (legajo) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE recetaMedica (
	idReceta SERIAL PRIMARY KEY,
	fecha DATE NOT NULL,
	descripcion VARCHAR(500),
	estado VARCHAR(30) NOT NULL CHECK (estado IN ('Asignado', 'Entregado')),
	legajoEnfermera VARCHAR(15),
	legajoPsiquiatra VARCHAR(15),
	numeroEvolucion INT,
	dni VARCHAR(10),
	FOREIGN KEY (legajoEnfermera) REFERENCES enfermera (legajo) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (legajoPsiquiatra) REFERENCES psiquiatra (legajo) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (numeroEvolucion, dni) REFERENCES evolucion (numeroEvolucion, dni) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE medicamento (
	idMedicamento SERIAL PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	dosis INT,
	tipo VARCHAR(50)
);

CREATE TABLE stock (
	fecha DATE,
	cantidad INT NOT NULL,
	idMedicamento INT,
	PRIMARY KEY (fecha, idMedicamento),
	FOREIGN KEY (idMedicamento) REFERENCES medicamento (idMedicamento) ON UPDATE CASCADE ON DELETE cascade
);

CREATE TABLE dona (
	fechaDonado DATE,
	cantEspecifica INT NOT NULL,
	idMedicamento INT,
	dni VARCHAR(10),
	PRIMARY KEY (fechaDonado, idMedicamento),
	FOREIGN KEY (idMedicamento) REFERENCES medicamento (idMedicamento) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (dni) REFERENCES paciente (dni) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE sot (
	fecha DATE,
	hora TIME,
	motivoLlamado VARCHAR(50),
	observacionLlamado VARCHAR(500),
	dni VARCHAR(10),
	legajoAcompaniante VARCHAR(15),
	PRIMARY KEY (fecha, hora),
	FOREIGN KEY (dni) REFERENCES paciente (dni) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (legajoAcompaniante) REFERENCES acompanianteTerapeutico (legajo) ON UPDATE CASCADE ON DELETE CASCADE
);
