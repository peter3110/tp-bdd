-- Busquedas

-- Datos de las personas que fueron sospechosas
SELECT * FROM Personas p
	WHERE p.dni IN (
		SELECT dni FROM Involucra i
			JOIN RolEnCaso rc ON i.idRol = rc.idRol
			WHERE rc.nombreRol = 'Acusado'
	);


-- Direcciones donde convivieron personas sospechosas de diferentes casos
SELECT prov.nombreProvincia, ciu.nombreCiudad, ca.nombreCalle, dom.altura, dom.piso, dom.depto FROM Domicilios dom
	JOIN Calles ca ON dom.idCalle = ca.idCalle
	JOIN Ciudades ciu ON ciu.idCiudad = ca.idCiudad
	JOIN Provincias prov ON prov.idProvincia = ciu.idProvincia
	WHERE dom.idDomicilio IN
		(SELECT idDomicilio FROM Domicilios dom2
			WHERE (
				SELECT COUNT(*) FROM Personas p
					JOIN Involucra i ON i.dni = p.dni 
					JOIN RolEnCaso rc ON rc.idRol = i.idRol
				WHERE p.idDomicilio = dom2.idDomicilio AND
					  rc.nombreRol = 'Acusado'
				GROUP BY i.idCaso
			) > 1
		);

-- Oficiales que participaron en la cadena de custodia de evidencias para más de un caso
SELECT * FROM OficialDePolicia Op
	WHERE (
		SELECT 
	) > 1;

-- La sucesión de eventos de personas involucradas en un caso

-- Un ranking de oficiales exitosos, es decir los que cerraron mayor cantidad de casos (resueltos)

-- Las ubicaciones de todas las evidencias de un caso

-- La lista de oficiales involucrados en un caso

-- Las categorías de casos ordenadas por cantidad de casos

-- Todos los testimonios de un caso dado

--Para una categoría en particular listar, para cada uno de los casos, los testimonios asociados