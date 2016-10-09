
-- Personas
CREATE TABLE Personas
(
	dni INTEGER PRIMARY KEY,
	nombre VARCHAR(20),
	apellido VARCHAR(20),
	fechaDeNacimiento DATE,
	idDomicilio INTEGER
);

INSERT INTO Personas (dni, nombre, apellido, fechaDeNacimiento, idDomicilio)
	VALUES (37206752, 'Pedro', 'Rodriguez', '1992-10-31', 1);

-- TelefonoPersona
CREATE TABLE TelefonosPersonas
(
	numero INTEGER PRIMARY KEY,
	dniPersona INTEGER
);

INSERT INTO TelefonosPersonas (numero, dniPersona)
	VALUES (1544009743, 1);

-- TelefonosDepartamentos
CREATE TABLE TelefonosDepartamentos 
(
	numero INTEGER PRIMARY KEY,
	idDepartamento INTEGER
);

INSERT INTO TelefonosDepartamentos (numero, idDepartamento) 
	VALUES (47478888, 1);

-- RolEnCaso
CREATE TABLE RolEnCaso
(
	idRol INTEGER PRIMARY KEY,
	nombreRol VARCHAR(20)
);

INSERT INTO RolEnCaso (idRol, nombreRol) 
	VALUES (1, 'Acusado');

-- CategoriaCaso
CREATE TABLE CategoriasCasos 
(
	idCategoria INTEGER PRIMARY KEY,
	nombreCategoria VARCHAR(20),
	cantidadDeCasos INTEGER
);

INSERT INTO CategoriasCasos (idCategoria, nombreCategoria, cantidadDeCasos)
	VALUES(1, 'Robo', 1);

-- OficialDePolicia
CREATE TABLE OficialDePolicia
(
	dni INTEGER PRIMARY KEY,
	numeroPlaca INTEGER,
	fechaIngreso DATE,
	numeroEscritorio INTEGER,
	idRango INTEGER, 
	idServicio INTEGER, 
	idDepartamento INTEGER
);

INSERT INTO OficialDePolicia (dni, numeroPlaca, fechaIngreso, numeroEscritorio, idRango, idServicio, idDepartamento)
	VALUES (20412312, 1111, '2015-10-10', 12, 1, 1, 1);

-- Servicio
CREATE TABLE Servicio 
(
	idServicio INTEGER PRIMARY KEY,
	nombre VARCHAR(20)
);

INSERT INTO Servicio (idServicio, nombre)
	VALUES (1, 'Servicio 1');

-- Rangos
CREATE TABLE Rangos
(
	idRango INTEGER,
	nombre VARCHAR(20)
);

INSERT INTO Rangos (idRango, nombre) VALUES (1, 'Rango 1');

-- CasosCriminales
CREATE TABLE CasosCriminales
(
	idCaso INTEGER PRIMARY KEY,
	fechaOcurrio DATE,
	horaOcurrio VARCHAR(20),
	lugarOcurrio VARCHAR(20),
	descripcion VARCHAR(200),
	fechaIngreso DATE,
	idCategoria INTEGER,
	idInvestigadorPrincipal INTEGER,
	idInvestigadorResolvedor INTEGER
);

INSERT INTO CasosCriminales (idCaso, fechaOcurrio, horaOcurrio, lugarOcurrio, descripcion, fechaIngreso, idCategoria, idInvestigadorPrincipal, idInvestigadorResolvedor)
	VALUES (1, '2014-09-09', '14:00 hs', 'en una casa', 'un robo siniestro', '2014-10-10', 1, 1, 1);

-- EstadosCasos
CREATE TABLE EstadosCasos
(
	idEstado INTEGER PRIMARY KEY,
	idCaso INTEGER,
	fecha DATE
);

INSERT INTO EstadosCasos (idEstado, idCaso, fecha) VALUES (1,1,'2014-10-10');

-- Resueltos
CREATE TABLE Resueltos
(
	idEstado INTEGER PRIMARY KEY,
	idCaso INTEGER,
	descripcionResuelto VARCHAR(200)
);

-- INSERT INTO Resueltos ...\

-- Pendientes
CREATE TABLE Pendientes
(
	idEstado INTEGER PRIMARY KEY,
	idCaso INTEGER
);

INSERT INTO Pendientes (idEstado, idCaso) VALUES (1,1);

-- Congelados
CREATE TABLE Congelados
(
	idEstado INTEGER PRIMARY KEY,
	idCaso INTEGER,
	fechaCongelado DATE
	comentario VARCHAR(200)
);

-- INSERT INTO Congelados ...

-- Descartados 
CREATE TABLE Descartados
(
	idEstado INTEGER PRIMARY KEY,
	idCaso INTEGER,
	fechaDescartado DATE,
	motivo VARCHAR(200)
);

-- INSERT INTO Descartados ...

-- Eventos
CREATE TABLE Eventos
(
	idEvento INTEGER PRIMARY KEY,
	fechaOcurrio DATE,
	horaOcurrio VARCHAR(20),
	descripcion VARCHAR(200)
);

-- INSERT INTO Eventos ...

-- Evidencia 
CREATE TABLE Evidencia
(
	idEvidencia INTEGER PRIMARY KEY,
	fechaEncuentro DATE,
	horaEncuentro VARCHAR(20),
	descripcion VARCHAR(200),
	fechaSellado DATE,
	horaSellado VARCHAR(20), 
	fechaIngreso DATE,
	idCaso INTEGER
);

-- INSERT INTO Evidencia ...

-- Departamento
CREATE TABLE Departamento 
(
	idDepartamento INTEGER PRIMARY KEY,
	nombre VARCHAR(20),
	idDepartamentoSupervisor INTEGER,
	idDomicilio INTEGER
);

INSERT INTO Departamento (idDepartamento, nombre, idDepartamentoSupervisor, idDomicilio)
	VALUES (1,'Departamento de policia 1', null, 1);

-- Domicilios
CREATE TABLE Domicilios
(
	idDomicilio INTEGER PRIMARY KEY,
	altura INTEGER,
	piso INTEGER, 
	depto VARCHAR('5'), 
	idCalle INTEGER
);

INSERT INTO Domicilios (idDomicilio, altura, piso, depto, idCalle)
	VALUES (1, 100, 1, 'B', 1);
	
-----------------
-- Calles
CREATE TABLE Calles
(
	idCalle INTEGER PRIMARY KEY,
	nombreCalle VARCHAR(20),
	idCiudad INTEGER
);
-- Ciudades
CREATE TABLE Ciudades
(
	idCiudad INTEGER PRIMARY KEY,
	nombreCiudad VARCHAR(20),
	idProvincia INTEGER
);
-- Provincias
CREATE TABLE Provincias 
(
	idProvincia INTEGER PRIMARY KEY,
	nombreProvincia VARCHAR(20)
);
-- Culpables
CREATE TABLE Culpables
(
	dni INTEGER,
	idCaso INTEGER,
	PRIMARY KEY (dni, idCaso)
);
-- InvestigadoresAuxiliares
CREATE TABLE InvestigadoresAuxiliares
(
	idCaso INTEGER,
	dniOficialPolicia INTEGER,
	PRIMARY KEY (idCaso, dniOficialPolicia)
);
-- Involucra
CREATE TABLE Involucra 
(
	dni INTEGER,
	idCaso INTEGER,
	idRol INTEGER,
	PRIMARY KEY (dni, idCaso)
);
-- ParticipaEn
CREATE TABLE ParticipaEn
(
	dni INTEGER,
	idEvento INTEGER,
	idCaso INTEGER,
	PRIMARY KEY (dni, idEvento)
);
-- PresentaTestimonio
CREATE TABLE PresentaTestimonio
(
	texto VARCHAR(200),
	fecha DATE,
	dniTestigo INTEGER,
	idCaso INTEGER, 
	dniOficial INTEGER,
	PRIMARY KEY (fecha, dniTestigo, idCaso)
);
-- Custodia
CREATE TABLE Custodia
(
	idEvidencia INTEGER,
	dniOficial INTEGER,
	idDomicilio INTEGER,
	comentario VARCHAR(200),
	hora VARCHAR(20),
	fecha DATE,
	idCustodia INTEGER,
	PRIMARY KEY (idEvidencia, dniOficial, idCustodia)
);
