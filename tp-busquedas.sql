SHOW DATABASES;
USE mydb;

/* Consulta 1a : llamar con Usuario_vendedor o Usuario_comprador */    
    
SELECT * FROM
  (SELECT Usuarios_idUsuario AS Usuario_vendedor, Usuario_comprador,idPublicacion,descripcion 
   FROM Publicaciones pub JOIN
   (SELECT Usuarios_idUsuario AS Usuario_comprador, idOperacion,Subastas_Publicaciones_idPublicacion, 
		  Ventas_Publicaciones_idPublicacion,Servicios_Publicaciones_idPublicacion 
	  FROM (SELECT * FROM Operaciones op1 WHERE op1.Pagos_idPago IS NOT NULL) op 
      LEFT JOIN Ofertas of ON op.idOperacion=of.Operaciones_idOperacion
	  LEFT JOIN Contrataciones contr ON op.idOperacion=contr.Operaciones_idOperacion
      LEFT JOIN Compras comp ON op.idOperacion=comp.Operaciones_idOperacion ) z
	  ON ( pub.idPublicacion=z.Subastas_Publicaciones_idPublicacion OR
		  pub.idPublicacion=z.Ventas_Publicaciones_idPublicacion OR
          pub.idPublicacion=z.Servicios_Publicaciones_idPublicacion )) zz
      WHERE zz.Usuario_vendedor=1;
      
/* Consulta 1b : las primeras 3 categorias que visito con mayor frecuencia en el ultimo anio cada usuario */
SELECT * FROM 
 (SELECT Usuario_visitador, Categoria, COUNT(*) AS Cantidad_visitas FROM
  (SELECT Usuario_visitador, CategoriaPublicacion_idCategoriaPublicacion AS Categoria FROM
   (SELECT Usuarios_idUsuario AS Usuario_visitador,Publicaciones_idPublicacion
   FROM Usuarios_visita_Publicaciones v 
   WHERE YEAR(v.fecha) = YEAR(CURRENT_DATE) - 1) z
   JOIN Publicaciones pub ON pub.idPublicacion=z.Publicaciones_idPublicacion) z
   GROUP BY Usuario_visitador, Categoria) zz
   WHERE zz.Usuario_visitador=1 ORDER BY Cantidad_visitas;
    
    
    
