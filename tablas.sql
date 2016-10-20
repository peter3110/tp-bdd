-- Borra TODAS las tablas y vuelve a crearlas
DROP SCHEMA public CASCADE;
CREATE SCHEMA public;

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
INSERT INTO Personas (dni, nombre, apellido, fechaDeNacimiento, idDomicilio)
	VALUES (37273622, 'Lucas', 'Tavolaro', '1992-11-24', 2);
INSERT INTO Personas (dni, nombre, apellido, fechaDeNacimiento, idDomicilio)
	VALUES (40206752, 'Ignacio', 'Holzer', '1992-02-15', 3);
INSERT INTO Personas (dni, nombre, apellido, fechaDeNacimiento, idDomicilio)
	VALUES (40111222, 'Alan', 'Corti', '1992-11-22', 4);
INSERT INTO Personas (dni, nombre, apellido, fechaDeNacimiento, idDomicilio)
	VALUES (27206752, 'Lucas', 'Tavolaro', '1992-10-30', 5);

INSERT INTO Personas (dni, nombre, apellido, fechaDeNacimiento, idDomicilio)
	VALUES (27111222, 'Sebastian', 'Prillo', '1992-12-28', 6);
INSERT INTO Personas (dni, nombre, apellido, fechaDeNacimiento, idDomicilio)
	VALUES (27333444, 'Lucia', 'Amor', '1992-10-29', 7);
INSERT INTO Personas (dni, nombre, apellido, fechaDeNacimiento, idDomicilio)
	VALUES (20111222, 'Sofia', 'Rodriguez', '1992-09-21', 8);
INSERT INTO Personas (dni, nombre, apellido, fechaDeNacimiento, idDomicilio)
	VALUES (20333444, 'Camila', 'Rodriguez', '1992-08-25', 9);

INSERT INTO Personas (dni, nombre, apellido, fechaDeNacimiento, idDomicilio)
	VALUES (30303030, 'Camila', 'Rodolico', '1992-08-25', 10);
INSERT INTO Personas (dni, nombre, apellido, fechaDeNacimiento, idDomicilio)
	VALUES (40404040, 'Gustavo', 'Rodolico', '2000-08-25', 10);
INSERT INTO Personas (dni, nombre, apellido, fechaDeNacimiento, idDomicilio)
	VALUES (50505050, 'Camila', 'Rodolico', '1992-08-25', 10);

INSERT INTO Personas (dni, nombre, apellido, fechaDeNacimiento, idDomicilio)
	VALUES (60606060, 'Ricardo', 'Arjona', '1950-08-25', 11);
INSERT INTO Personas (dni, nombre, apellido, fechaDeNacimiento, idDomicilio)
	VALUES (63123443, 'Analia', 'Arjona', '1990-08-25', 11);
INSERT INTO Personas (dni, nombre, apellido, fechaDeNacimiento, idDomicilio)
	VALUES (63791190, 'Maria', 'Arjona', '1955-08-25', 11);


-- TelefonoPersona
CREATE TABLE TelefonosPersonas
(
	numero INTEGER PRIMARY KEY,
	dniPersona INTEGER
);

-- Hay personas que no tienen numero de telefono
INSERT INTO TelefonosPersonas (numero, dniPersona)
	VALUES (15491133, 37273622);
INSERT INTO TelefonosPersonas (numero, dniPersona)
	VALUES (1591005498, 98114259);
INSERT INTO TelefonosPersonas (numero, dniPersona)
	VALUES (1544009743, 37206752);
INSERT INTO TelefonosPersonas (numero, dniPersona)
	VALUES (1544007192, 372111222);
INSERT INTO TelefonosPersonas (numero, dniPersona)
	VALUES (1553278965, 40206752);
INSERT INTO TelefonosPersonas (numero, dniPersona)
	VALUES (45678910, 40111222);
INSERT INTO TelefonosPersonas (numero, dniPersona)
	VALUES (49494949, 27206752);
INSERT INTO TelefonosPersonas (numero, dniPersona)
	VALUES (45454545, 27111222);
INSERT INTO TelefonosPersonas (numero, dniPersona)
	VALUES (47474747, 27333444);
INSERT INTO TelefonosPersonas (numero, dniPersona)
	VALUES (48122091, 20111222);
INSERT INTO TelefonosPersonas (numero, dniPersona)
	VALUES (48484848, 20333444);

-- TelefonosDepartamentos
CREATE TABLE TelefonosDepartamentos
(
	numero INTEGER PRIMARY KEY,
	idDepartamento INTEGER
);

INSERT INTO TelefonosDepartamentos (numero, idDepartamento)
	VALUES (41414141, 1);
INSERT INTO TelefonosDepartamentos (numero, idDepartamento)
	VALUES (40404040, 2);
INSERT INTO TelefonosDepartamentos (numero, idDepartamento)
	VALUES (442424242, 3);
INSERT INTO TelefonosDepartamentos (numero, idDepartamento)
	VALUES (47478888, 4);
INSERT INTO TelefonosDepartamentos (numero, idDepartamento)
	VALUES (43312866, 5);
INSERT INTO TelefonosDepartamentos (numero, idDepartamento)
	VALUES (45278108, 6);
INSERT INTO TelefonosDepartamentos (numero, idDepartamento)
	VALUES (47611093, 7);
INSERT INTO TelefonosDepartamentos (numero, idDepartamento)
	VALUES (43333287, 8);
INSERT INTO TelefonosDepartamentos (numero, idDepartamento)
	VALUES (40142199, 9);

-- RolEnCaso
CREATE TABLE RolEnCaso
(
	idRol INTEGER PRIMARY KEY,
	nombreRol VARCHAR(20)
);

INSERT INTO RolEnCaso (idRol, nombreRol)
	VALUES (1, 'Acusado');
INSERT INTO RolEnCaso (idRol, nombreRol)
	VALUES (2, 'Victima');
INSERT INTO RolEnCaso (idRol, nombreRol)
	VALUES (3, 'Testigo');

-- CategoriaCaso
CREATE TABLE CategoriasCasos
(
	idCategoria INTEGER PRIMARY KEY,
	nombreCategoria VARCHAR(20),
	cantidadDeCasos INTEGER
);

INSERT INTO CategoriasCasos (idCategoria, nombreCategoria, cantidadDeCasos)
	VALUES(1, 'Robo', 2);

INSERT INTO CategoriasCasos (idCategoria, nombreCategoria, cantidadDeCasos)
	VALUES(2, 'Homicidio', 1);

INSERT INTO CategoriasCasos (idCategoria, nombreCategoria, cantidadDeCasos)
	VALUES(3, 'Venta Ilegal', 1);

INSERT INTO CategoriasCasos (idCategoria, nombreCategoria, cantidadDeCasos)
	VALUES(4, 'Lavado de dinero', 1);

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
	VALUES (37206752, 1111, '2015-10-10', 12, 2, 1, 1);
INSERT INTO OficialDePolicia (dni, numeroPlaca, fechaIngreso, numeroEscritorio, idRango, idServicio, idDepartamento)
	VALUES (37273622, 2000, '2016-08-01', 4, 1, 1, 1);
INSERT INTO OficialDePolicia (dni, numeroPlaca, fechaIngreso, numeroEscritorio, idRango, idServicio, idDepartamento)
	VALUES (40206752, 280, '2013-03-10', 18, 6, 2, 2);
INSERT INTO OficialDePolicia (dni, numeroPlaca, fechaIngreso, numeroEscritorio, idRango, idServicio, idDepartamento)
	VALUES (40111222, 769, '2014-11-20', 12, 4, 2, 3);
INSERT INTO OficialDePolicia (dni, numeroPlaca, fechaIngreso, numeroEscritorio, idRango, idServicio, idDepartamento)
	VALUES (27206752, 2014, '2016-08-20', 7, 1, 4, 3);

-- Servicio
CREATE TABLE Servicio
(
	idServicio INTEGER PRIMARY KEY,
	nombre VARCHAR(100)
);

INSERT INTO Servicio (idServicio, nombre) VALUES (1, 'Via publica');
INSERT INTO Servicio (idServicio, nombre) VALUES (2, 'Emergencia');
INSERT INTO Servicio (idServicio, nombre) VALUES (3, 'Desastres');
INSERT INTO Servicio (idServicio, nombre) VALUES (4, 'Busqueda y Rescate');

-- Rangos
CREATE TABLE Rangos
(
	idRango INTEGER,
	nombre VARCHAR(20)
);

INSERT INTO Rangos (idRango, nombre) VALUES (1, 'Agente');
INSERT INTO Rangos (idRango, nombre) VALUES (2, 'Cabo');
INSERT INTO Rangos (idRango, nombre) VALUES (3, 'Sargento ');
INSERT INTO Rangos (idRango, nombre) VALUES (4, 'Suboficial');
INSERT INTO Rangos (idRango, nombre) VALUES (5, 'Inspector');
INSERT INTO Rangos (idRango, nombre) VALUES (6, 'Comisario');


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
	VALUES (1, '2014-09-09', '14:00 hs', 'en una casa', 'un robo siniestro', '2014-10-10', 1, 37206752, 40206752);
INSERT INTO CasosCriminales (idCaso, fechaOcurrio, horaOcurrio, lugarOcurrio, descripcion, fechaIngreso, idCategoria, idInvestigadorPrincipal, idInvestigadorResolvedor)
	VALUES (2, '2016-04-10', '08:22 hs', 'en la calle', 'robo de celular', '2016-04-11', 1, 37273622, 37206752);
INSERT INTO CasosCriminales (idCaso, fechaOcurrio, horaOcurrio, lugarOcurrio, descripcion, fechaIngreso, idCategoria, idInvestigadorPrincipal, idInvestigadorResolvedor)
	VALUES (3, '2015-01-19', '02:15 hs', 'en la calle', 'se encotró una persona asesinada', '2015-01-19', 2, 40206752, 40111222);
INSERT INTO CasosCriminales (idCaso, fechaOcurrio, horaOcurrio, lugarOcurrio, descripcion, fechaIngreso, idCategoria, idInvestigadorPrincipal, idInvestigadorResolvedor)
	VALUES (4, '2016-10-09', '16:10 hs', 'en un local', 'se encontró venta de animales ilegales', '2016-10-09', 3, 40206752, 37273622);
INSERT INTO CasosCriminales (idCaso, fechaOcurrio, horaOcurrio, lugarOcurrio, descripcion, fechaIngreso, idCategoria, idInvestigadorPrincipal, idInvestigadorResolvedor)
	VALUES (5, '2014-10-19', '20:00 hs', 'en un local', 'venta ilegal de dolares', '2014-10-20', 4, 37206752, 40111222);

-- EstadosCasos
CREATE TABLE EstadosCasos
(
	idEstado INTEGER PRIMARY KEY,
	idCaso INTEGER,
	fecha DATE
);

INSERT INTO EstadosCasos (idEstado, idCaso, fecha) VALUES (1,1,'2014-10-20');
INSERT INTO EstadosCasos (idEstado, idCaso, fecha) VALUES (2,2,'2016-05-11');
INSERT INTO EstadosCasos (idEstado, idCaso, fecha) VALUES (3,3,'2015-03-02');
INSERT INTO EstadosCasos (idEstado, idCaso, fecha) VALUES (4,4,'2016-10-10');
INSERT INTO EstadosCasos (idEstado, idCaso, fecha) VALUES (5,5,'2015-03-23');
INSERT INTO EstadosCasos (idEstado, idCaso, fecha) VALUES (6, 1, '2014-10-10');
INSERT INTO EstadosCasos (idEstado, idCaso, fecha) VALUES (7, 2, '2016-04-11');
INSERT INTO EstadosCasos (idEstado, idCaso, fecha) VALUES (8, 3, '2015-01-19');
INSERT INTO EstadosCasos (idEstado, idCaso, fecha) VALUES (9, 5, '2014-10-20');
INSERT INTO EstadosCasos (idEstado, idCaso, fecha) VALUES (10, 1, '2014-10-13');


-- Resueltos
CREATE TABLE Resueltos
(
	idEstado INTEGER PRIMARY KEY,
	idCaso INTEGER,
	descripcionResuelto VARCHAR(200)
);

INSERT INTO Resueltos (idEstado, idCaso, descripcionResuelto)
	VALUES (1,1,'Fue encontrado el asaltante');
INSERT INTO Resueltos (idEstado, idCaso, descripcionResuelto)
	VALUES (5,5,'Se encontraron mas locales que realizaban actividades similares y fueron todos cerrados');

-- Pendientes
CREATE TABLE Pendientes
(
	idEstado INTEGER PRIMARY KEY,
	idCaso INTEGER
);

INSERT INTO Pendientes (idEstado, idCaso) VALUES (6,1);
INSERT INTO Pendientes (idEstado, idCaso) VALUES (7,2);
INSERT INTO Pendientes (idEstado, idCaso) VALUES (8,3);
INSERT INTO Pendientes (idEstado, idCaso) VALUES (4,4);
INSERT INTO Pendientes (idEstado, idCaso) VALUES (9,5);

-- Congelados
CREATE TABLE Congelados
(
	idEstado INTEGER PRIMARY KEY,
	idCaso INTEGER,
	fechaCongelado DATE,
	comentario VARCHAR(200)
);

INSERT INTO Congelados (idEstado, idCaso, fechaCongelado, comentario)
	VALUES (3, 3, '2016-02-04', 'No pudo ser identificado el asesino');
INSERT INTO Congelados (idEstado, idCaso, fechaCongelado, comentario)
	VALUES (10, 1, '2014-10-13', 'Caso congelado hasta que existan novedades');

-- Descartados
CREATE TABLE Descartados
(
	idEstado INTEGER PRIMARY KEY,
	idCaso INTEGER,
	fechaDescartado DATE,
	motivo VARCHAR(200)
);

INSERT INTO Descartados (idEstado, idCaso, fechaDescartado, motivo)
	VALUES (2, 2, '2016-06-20', 'Imposible encontrar el dispositivo');

-- Eventos
CREATE TABLE Eventos
(
	idEvento INTEGER PRIMARY KEY,
	fechaOcurrio DATE,
	horaOcurrio VARCHAR(20),
	descripcion VARCHAR(200)
);

INSERT INTO Eventos (idEvento, fechaOcurrio, horaOcurrio, descripcion)
	VALUES (1, '2016-05-01', '18:45', 'La compañia de telefono respondió el pedido de información');
INSERT INTO Eventos (idEvento, fechaOcurrio, horaOcurrio, descripcion)
	VALUES (2, '2016-06-01', '07:05', 'No se encontró actividad del celular por un mes');
INSERT INTO Eventos (idEvento, fechaOcurrio, horaOcurrio, descripcion)
	VALUES (3, '2015-02-15', '11:15', 'Fue reconocida la persona');
INSERT INTO Eventos (idEvento, fechaOcurrio, horaOcurrio, descripcion)
	VALUES (4, '2015-02-28', '15:00', 'No se encontraron rastros del sospechoso en la persona');
INSERT INTO Eventos (idEvento, fechaOcurrio, horaOcurrio, descripcion)
	VALUES (5, '2014-11-10', '17:20', 'Se registraron negocios cercanos con los que se habían hecho transacciones');

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

INSERT INTO Evidencia (idEvidencia, fechaEncuentro, horaEncuentro, descripcion, fechaSellado, horaSellado, fechaIngreso, idCaso)
	VALUES (1, '2014-10-28', '10:00', 'libro de actas', '2014-10-28', '15:00', '2014-10-29', 5);
INSERT INTO Evidencia (idEvidencia, fechaEncuentro, horaEncuentro, descripcion, fechaSellado, horaSellado, fechaIngreso, idCaso)
	VALUES (2, '2014-11-04', '13:10', 'libro de actas de otro local', '2014-11-05', '06:00', '2014-11-05', 5);
INSERT INTO Evidencia (idEvidencia, fechaEncuentro, horaEncuentro, descripcion, fechaSellado, horaSellado, fechaIngreso, idCaso)
	VALUES (3, '2015-01-19', '20:45', 'pertenencias de la persona', '2014-01-20', '12:30', '2014-01-21', 3);
INSERT INTO Evidencia (idEvidencia, fechaEncuentro, horaEncuentro, descripcion, fechaSellado, horaSellado, fechaIngreso, idCaso)
	VALUES (4, '2016-10-19', '8:40', 'registro de compra de animales', '2016-10-19', '14:25', '2014-10-19', 4);

-- Departamento
CREATE TABLE Departamento
(
	idDepartamento INTEGER PRIMARY KEY,
	nombre VARCHAR(50),
	idDepartamentoSupervisor INTEGER,
	idDomicilio INTEGER
);

INSERT INTO Departamento (idDepartamento, nombre, idDepartamentoSupervisor, idDomicilio)
	VALUES (1,'Departamento de policia Almagro', null, 1);
INSERT INTO Departamento (idDepartamento, nombre, idDepartamentoSupervisor, idDomicilio)
	VALUES (2,'Departamento de policia Nuñez', 1, 2);
INSERT INTO Departamento (idDepartamento, nombre, idDepartamentoSupervisor, idDomicilio)
	VALUES (3,'Departamento de policia Barracas', 2, 3);

-- Domicilios
CREATE TABLE Domicilios
(
	idDomicilio INTEGER PRIMARY KEY,
	altura INTEGER,
	piso INTEGER,
	depto VARCHAR(5),
	idCalle INTEGER
);

INSERT INTO Domicilios (idDomicilio, altura, piso, depto, idCalle)
	VALUES (1, 100, 1, 'B', 1);
INSERT INTO Domicilios (idDomicilio, altura, piso, depto, idCalle)
	VALUES (2, 1678, 0, 'PB', 2);
INSERT INTO Domicilios (idDomicilio, altura, piso, depto, idCalle)
	VALUES (3, 3000, 3, 'E', 3);
INSERT INTO Domicilios (idDomicilio, altura, piso, depto, idCalle)
	VALUES (4, 4000, 3, 'E', 3);
INSERT INTO Domicilios (idDomicilio, altura, piso, depto, idCalle)
	VALUES (5, 5000, 3, 'E', 3);
INSERT INTO Domicilios (idDomicilio, altura, piso, depto, idCalle)
	VALUES (6, 6000, 3, 'E', 3);
INSERT INTO Domicilios (idDomicilio, altura, piso, depto, idCalle)
	VALUES (7, 7000, 3, 'E', 3);
INSERT INTO Domicilios (idDomicilio, altura, piso, depto, idCalle)
	VALUES (8, 8000, 3, 'E', 3);
INSERT INTO Domicilios (idDomicilio, altura, piso, depto, idCalle)
	VALUES (9, 9000, 3, 'E', 3);

INSERT INTO Domicilios (idDomicilio, altura, piso, depto, idCalle)
	VALUES (10, 2000, 3, 'E', 1);
INSERT INTO Domicilios (idDomicilio, altura, piso, depto, idCalle)
	VALUES (11, 3000, 3, 'E', 2);
INSERT INTO Domicilios (idDomicilio, altura, piso, depto, idCalle)
	VALUES (12, 2000, 3, 'E', 1);
INSERT INTO Domicilios (idDomicilio, altura, piso, depto, idCalle)
	VALUES (13, 3000, 3, 'E', 2);
-----------------
-- Calles
CREATE TABLE Calles
(
	idCalle INTEGER PRIMARY KEY,
	nombreCalle VARCHAR(100),
	idCiudad INTEGER
);

INSERT INTO Calles (idCalle, nombreCalle, idCiudad)
	VALUES (1, 'Sanchez de Bustamante', 1);
INSERT INTO Calles (idCalle, nombreCalle, idCiudad)
	VALUES (2, '3 de Febrero', 1);
INSERT INTO Calles (idCalle, nombreCalle, idCiudad)
	VALUES (3, 'Finochietto', 1);

-- Ciudades
CREATE TABLE Ciudades
(
	idCiudad INTEGER PRIMARY KEY,
	nombreCiudad VARCHAR(100),
	idProvincia INTEGER
);

INSERT INTO Ciudades (idCiudad, nombreCiudad, idProvincia)
	VALUES (1, 'Ciudad Autonoma de Buenos Aires', 1);
INSERT INTO Ciudades (idCiudad, nombreCiudad, idProvincia)
	VALUES (2, 'La Plata', 2);
INSERT INTO Ciudades (idCiudad, nombreCiudad, idProvincia)
	VALUES (3, 'Mar del Plata', 3);

-- Provincias
CREATE TABLE Provincias
(
	idProvincia INTEGER PRIMARY KEY,
	nombreProvincia VARCHAR(100)
);

INSERT INTO Provincias (idProvincia, nombreProvincia)
	VALUES (1, 'Ciudad Autonoma de Buenos Aires');
INSERT INTO Provincias (idProvincia, nombreProvincia)
	VALUES (2, 'Buenos Aires');

-- Culpables
CREATE TABLE Culpables
(
	dni INTEGER,
	idCaso INTEGER,
	PRIMARY KEY (dni, idCaso)
);

INSERT INTO Culpables (dni, idCaso)
	VALUES (24586001, '1');
INSERT INTO Culpables (dni, idCaso)
	VALUES (28111322, '4');
INSERT INTO Culpables (dni, idCaso)
	VALUES (19876552, '4');
INSERT INTO Culpables (dni, idCaso)
	VALUES (30112906, '4');
INSERT INTO Culpables (dni, idCaso)
	VALUES (27654443, '5');

-- InvestigadoresAuxiliares
CREATE TABLE InvestigadoresAuxiliares
(
	idCaso INTEGER,
	dniOficialPolicia INTEGER,
	PRIMARY KEY (idCaso, dniOficialPolicia)
);

INSERT INTO InvestigadoresAuxiliares (idCaso, dniOficialPolicia)
	VALUES (5, 27206752);
INSERT INTO InvestigadoresAuxiliares (idCaso, dniOficialPolicia)
	VALUES (4, 27206752);
INSERT INTO InvestigadoresAuxiliares (idCaso, dniOficialPolicia)
	VALUES (4, 37206752);

-- Involucra
CREATE TABLE Involucra
(
	dni INTEGER,
	idCaso INTEGER,
	idRol INTEGER,
	PRIMARY KEY (dni, idCaso)
);

INSERT INTO Involucra (dni, idCaso, idRol)
	VALUES (27111222, 1, 1);
INSERT INTO Involucra (dni, idCaso, idRol)
	VALUES (27333444, 2, 1);
INSERT INTO Involucra (dni, idCaso, idRol)
	VALUES (20111222, 3, 2);
INSERT INTO Involucra (dni, idCaso, idRol)
	VALUES (20333444, 4, 2);
INSERT INTO Involucra (dni, idCaso, idRol)
	VALUES (30303030, 5, 3);

-- ParticipaEn
CREATE TABLE ParticipaEn
(
	dni INTEGER,
	idEvento INTEGER,
	idCaso INTEGER,
	PRIMARY KEY (dni, idEvento)
);

INSERT INTO ParticipaEn (dni, idEvento, idCaso)
	VALUES (40404040, 1, 2);
INSERT INTO ParticipaEn (dni, idEvento, idCaso)
	VALUES (40404040, 2, 2);
INSERT INTO ParticipaEn (dni, idEvento, idCaso)
	VALUES (50505050, 3, 3);
INSERT INTO ParticipaEn (dni, idEvento, idCaso)
	VALUES (60606060, 4, 3);
INSERT INTO ParticipaEn (dni, idEvento, idCaso)
	VALUES (50505050, 5, 5);

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

INSERT INTO PresentaTestimonio (texto, fecha, dniTestigo, idCaso, dniOficial)
	VALUES ('el dueño del negocio declara', '2014-11-20', 63123443, 5, 37206752);
INSERT INTO PresentaTestimonio (texto, fecha, dniTestigo, idCaso, dniOficial)
	VALUES ('el policia que vio el hecho declara', '2015-01-25', 37206752, 5, 40111222);

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

INSERT INTO Custodia (idEvidencia, dniOficial, idDomicilio, comentario, hora, fecha, idCustodia)
	VALUES (1, 37206752, 2, 'dejado el libro de actas en la comisaria mas cercana', '10:00', '2014-10-29', 1);
INSERT INTO Custodia (idEvidencia, dniOficial, idDomicilio, comentario, hora, fecha, idCustodia)
	VALUES (1, 37206752, 1, 'movido al lugar de trabajo', '08:00', '2014-11-01', 2);
INSERT INTO Custodia (idEvidencia, dniOficial, idDomicilio, comentario, hora, fecha, idCustodia)
	VALUES (2, 27206752, 3, 'bajo custodio el libro de otro local', '9:45', '2014-11-05', 3);
