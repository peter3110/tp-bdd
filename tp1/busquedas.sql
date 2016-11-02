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
			WHERE EXISTS(
				SELECT p1.dni FROM Personas p1
					WHERE p1.idDomicilio = dom2.idDomicilio AND
					p1.dni IN (
						SELECT i.dni FROM Involucra i
							JOIN RolEnCaso rc ON i.idRol = rc.idRol
							WHERE rc.nombreRol = 'Acusado'
					) AND EXISTS (
						SELECT i2.dni FROM Involucra i2
							JOIN RolEnCaso rc2 ON i2.idRol = rc2.idRol
							WHERE rc2.nombreRol = 'Acusado' AND
								  p1.dni != i2.dni
					)
			)
		);

-- Oficiales que participaron en la cadena de custodia de evidencias para más de un caso
SELECT op.dni, op.numeroPlaca FROM OficialDePolicia op
	WHERE (
		SELECT COUNT(*) FROM Custodia cust
		WHERE cust.dniOficial = op.dni
		GROUP BY cust.dniOficial
	) > 1;

-- La sucesión de eventos de personas involucradas en un caso
SELECT e.idEvento, e.fechaOcurrio, e.horaOcurrio, e.descripcion, pe.dni FROM Eventos e
	JOIN ParticipaEn pe ON e.idEvento = pe.idEvento
	WHERE pe.idCaso = 2
ORDER BY (pe.dni, e.fechaOcurrio, e.horaOcurrio) DESC;

-- Un ranking de oficiales exitosos, es decir los que cerraron mayor cantidad de casos (resueltos)
SELECT op.dni, COUNT(*) AS cantResueltos FROM OficialDePolicia op
	JOIN CasosCriminales cc ON cc.idInvestigadorResolvedor = op.dni
GROUP BY op.dni
ORDER BY cantResueltos DESC;

-- Las ubicaciones de todas las evidencias de un caso
SELECT prov.nombreProvincia, ciu.nombreCiudad, ca.nombreCalle, dom.altura, dom.piso, dom.depto FROM Domicilios dom
	JOIN Calles ca ON dom.idCalle = ca.idCalle
	JOIN Ciudades ciu ON ciu.idCiudad = ca.idCiudad
	JOIN Provincias prov ON prov.idProvincia = ciu.idProvincia
	WHERE dom.idDomicilio IN
		(SELECT c.idDomicilio FROM Custodia c
			 JOIN Evidencia e on c.idEvidencia = e.idEvidencia
		 WHERE e.idCaso = 5
			 AND NOT EXISTS (
			  	 SELECT * FROM Custodia c2
			  	 WHERE c2.idEvidencia = c.idEvidencia AND
			  	  	   c2.fecha > c.fecha
			 )
		);

-- La lista de oficiales involucrados en un caso
SELECT * FROM OficialDePolicia op
	WHERE op.dni IN (
		SELECT i.dni FROM Involucra i
		WHERE i.idCaso = 4
	);

-- Las categorías de casos ordenadas por cantidad de casos
SELECT nombreCategoria FROM CategoriasCasos ORDER BY cantidadDeCasos;

-- Todos los testimonios de un caso dado
SELECT pt.texto FROM PresentaTestimonio pt
	JOIN CasosCriminales cc ON pt.idCaso = cc.idCaso
	WHERE cc.idCaso = 5;

--Para una categoría en particular listar, para cada uno de los casos, los testimonios asociados
SELECT * FROM CasosCriminales cc
  JOIN PresentaTestimonio pt ON pt.idCaso = cc.idCaso
WHERE cc.idCategoria = 4;
