CREATE DATABASE LabBD_Maria;
USE LabBD_Maria;

CREATE TABLE personalClinico (
	legajo VARCHAR(15) PRIMARY KEY,
	nombre VARCHAR(50),
	apellido VARCHAR(50),
	contrasenia VARCHAR(50) NOT NULL,
	fechaNac DATE,
	fotoPerfil TEXT,
	email VARCHAR(255) NOT NULL,
	estado VARCHAR(6) NOT NULL CHECK (estado IN ('ACTIVO', 'BAJA'))
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
	idRegistroBaja VARCHAR(15) PRIMARY KEY,
	fechaHora TIMESTAMP NOT NULL CHECK (VALUE >= '2010-01-01 00:00:00'),
	motivo VARCHAR(100) NOT NULL,
	legajoPersonal VARCHAR(15) NOT NULL,
	legajoAdmin VARCHAR(15) NOT NULL,
	FOREIGN KEY (legajoPersonal) REFERENCES personalClinico (legajo) ON UPDATE RESTRICT ON DELETE RESTRICT,
	FOREIGN KEY (legajoAdmin) REFERENCES administrativo (legajo) ON UPDATE RESTRICT ON DELETE RESTRICT
);

CREATE TABLE cargo (
	nombreCargo VARCHAR(50) PRIMARY KEY
);

CREATE TABLE asignado (
	fecha DATE,
	legajo VARCHAR(15),
	nombreCargo VARCHAR(50),
	PRIMARY KEY (fecha, legajo),
	FOREIGN KEY (legajo) REFERENCES administrativo (legajo) ON UPDATE RESTRICT ON DELETE RESTRICT,
	FOREIGN KEY (nombreCargo) REFERENCES cargo (nombreCargo) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE paciente (
	dni VARCHAR(10),
	tipoDni VARCHAR(15),
	nombre VARCHAR(50) NOT NULL,
	apellido VARCHAR(50) NOT NULL,
	obraSocial VARCHAR(30) NOT NULL,
	PRIMARY KEY (dni,tipoDni),
	fechaNac DATE NOT NULL,
	fechaIngreso DATE NOT NULL,
	foto TEXT
);

CREATE TABLE tratamientoGravedad (
	idTratamiento VARCHAR(20) PRIMARY KEY,
	gravedad VARCHAR(30) NOT NULL CHECK (gravedad IN ('Grave intensivo', 'Grave medianamente intensivo', 'Ambulatorio')),
	frecuencia VARCHAR(15) NOT NULL CHECK (VALUE IN ('ASIGNADO', 'AUTORIZADO','NO AUTORIZADO'))
);

CREATE TABLE recibe (
	fechaInicio DATE,
	fechaFin DATE,
	dni VARCHAR(10),
	tipoDni VARCHAR(20),
	idTratamiento VARCHAR(20) NOT NULL,
	PRIMARY KEY(fechaInicio, dni,tipoDni),
	FOREIGN KEY (dni,tipoDni) REFERENCES paciente (dni,tipoDni) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (idTratamiento) REFERENCES tratamientoGravedad (idTratamiento) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE diagnosticoMultiaxial (
	idDiagnostico VARCHAR(15) PRIMARY KEY,
	estado VARCHAR(30) NOT NULL
);

CREATE TABLE eje (
	codigoEje VARCHAR(15) PRIMARY KEY,
	descripcionEje VARCHAR(500) NOT NULL
);

CREATE TABLE nomenclador (
	codigoNomenclador VARCHAR(20),
	descripcion VARCHAR(500),
	codigoEje VARCHAR(20),
	PRIMARY KEY(codigoNomenclador, codigoEje),
	FOREIGN KEY (codigoEje) REFERENCES eje (codigoEje) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE contiene (
	idDiagnostico VARCHAR(15),
	codigoNomenclador VARCHAR(20),
	codigoEje VARCHAR(20),
	PRIMARY KEY(idDiagnostico, codigoNomenclador, codigoEje),
	FOREIGN KEY (idDiagnostico) REFERENCES diagnosticoMultiaxial (idDiagnostico) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (codigoNomenclador, codigoEje) REFERENCES nomenclador (codigoNomenclador, codigoEje) ON UPDATE RESTRICT ON DELETE RESTRICT
);

CREATE TABLE evolucion (
	numeroEvolucion VARCHAR(15),
	dni VARCHAR(10),
	tipoDni VARCHAR(15),
	estado VARCHAR(50) NOT NULL,
	motivoOcultado VARCHAR(50), 
	fechaHora TIMESTAMP NOT NULL CHECK (VALUE >= '2010-01-01 00:00:00'),
	descripcion VARCHAR(200) NOT NULL,
	legajoProfesional VARCHAR(15) NOT NULL,
	idDiagnostico VARCHAR(15) NOT NULL,
	PRIMARY KEY (numeroEvolucion, dni,tipoDni),
	FOREIGN KEY (dni,tipoDni) REFERENCES paciente (dni,tipoDni) ON UPDATE RESTRICT ON DELETE RESTRICT,
	FOREIGN KEY (legajoProfesional) REFERENCES profesional (legajo) ON UPDATE RESTRICT ON DELETE RESTRICT,
	FOREIGN KEY (idDiagnostico) REFERENCES diagnosticoMultiaxial (idDiagnostico) ON UPDATE CASCADE ON DELETE RESTRICT 
);

CREATE TABLE turno (
	idTurno SERIAL PRIMARY KEY,
	estado VARCHAR(30) NOT NULL CHECK (estado IN ('LIBRE', 'RESERVADO', 'CANCELADO', 'ATENDIDO')),
	fechaHora TIMESTAMP NOT NULL CHECK (VALUE >= '2010-01-01 00:00:00'),
	dni VARCHAR(10),
	tipoDni VARCHAR(15),
	legajoProfesional VARCHAR(15) NOT NULL,
	legajoAdmin VARCHAR(15),
	FOREIGN KEY (dni,tipoDni) REFERENCES paciente (dni,tipoDni) ON UPDATE CASCADE ON DELETE SET NULL,
	FOREIGN KEY (legajoProfesional) REFERENCES profesional (legajo) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (legajoAdmin) REFERENCES administrativo (legajo) ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE recetaMedica (
	idReceta VARCHAR(15) PRIMARY KEY,
	fecha DATE NOT NULL,
	descripcion VARCHAR(500),
	estado VARCHAR(20) DEFAULT 'ASIGNADO' CHECK (VALUE IN ('ASIGNADO', 'AUTORIZADO','NO AUTORIZADO')),
	legajoPsiquiatra VARCHAR(15) NOT NULL,
	numeroEvolucion VARCHAR(15) NOT NULL,
	dni VARCHAR(10) NOT NULL,
	tipoDni VARCHAR(15) NOT NULL,
	FOREIGN KEY (legajoPsiquiatra) REFERENCES psiquiatra (legajo) ON UPDATE CASCADE ON DELETE RESTRICT,
	FOREIGN KEY (numeroEvolucion, dni,tipoDni) REFERENCES evolucion (numeroEvolucion, dni,tipoDni) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE medicamento (
	idMedicamento VARCHAR(15) PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	dosis INT NOT NULL,
	tipo VARCHAR(50) NOT NULL
);

CREATE TABLE stock (
	fecha DATE,
	cantidad INT NOT NULL,
	idMedicamento VARCHAR(15),
	PRIMARY KEY (fecha, idMedicamento),
	FOREIGN KEY (idMedicamento) REFERENCES medicamento (idMedicamento) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE entregaMedicamento(
	idEntrega SERIAL PRIMARY KEY,
	fechaHora TIMESTAMP NOT NULL CHECK (VALUE >= '2010-01-01 00:00:00'),
	dosis VARCHAR(15) NOT NULL,
	legajoEnfermera VARCHAR(15) NOT NULL,
	idReceta VARCHAR(15) NOT NULL,
	idMedicamento VARCHAR(15) NOT NULL,
	dni VARCHAR(15) NOT NULL,
	tipoDni VARCHAR(15) NOT NULL,
	FOREIGN KEY (legajoEnfermera) REFERENCES enfermera(legajo) ON UPDATE CASCADE ON DELETE RESTRICT,
	FOREIGN KEY (idReceta) REFERENCES recetaMedica (idReceta) ON UPDATE CASCADE ON DELETE RESTRICT,
	FOREIGN KEY (idMedicamento) REFERENCES medicamento(idMedicamento) ON UPDATE CASCADE ON DELETE RESTRICT,
	FOREIGN KEY (dni,tipoDni) REFERENCES paciente(dni,tipoDni) ON UPDATE CASCADE ON DELETE RESTRICT

);

CREATE TABLE dona (
	fechaDonado DATE,
	cantEspecifica INT NOT NULL,
	idMedicamento VARCHAR(15),
	dni VARCHAR(10) NOT NULL,
	tipoDni VARCHAR(15) NOT NULL,
	PRIMARY KEY (fechaDonado, idMedicamento),
	FOREIGN KEY (idMedicamento) REFERENCES medicamento (idMedicamento) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (dni,tipoDni) REFERENCES paciente (dni,tipoDni) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE requiereDe(
	dosis INT NOT NULL,
	frecuencia VARCHAR(15) NOT NULL,
	idReceta VARCHAR(15),
	idMedicamento VARCHAR(15),
	PRIMARY KEY (idReceta,idMedicamento),
	FOREIGN KEY (idReceta) REFERENCES recetaMedica(idReceta) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (idMedicamento) REFERENCES medicamento(idMedicamento) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE sot (
	fechaHora TIMESTAMP PRIMARY KEY CHECK (VALUE >= '2010-01-01 00:00:00'),
	motivoLlamado VARCHAR(50),
	observacionLlamado VARCHAR(500) NOT NULL,
	dni VARCHAR(10) NOT NULL,
	tipoDni VARCHAR(15) NOT NULL,
	legajoAcompaniante VARCHAR(15) NOT NULL,
	FOREIGN KEY (dni,tipoDni) REFERENCES paciente (dni,tipoDni) ON UPDATE CASCADE ON DELETE RESTRICT,
	FOREIGN KEY (legajoAcompaniante) REFERENCES acompanianteTerapeutico (legajo) ON UPDATE CASCADE ON DELETE RESTRICT
);