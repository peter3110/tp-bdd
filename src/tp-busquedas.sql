SHOW DATABASES;
USE mydb;

/* Consulta 1a : para un usuario específico, información sobre los artículos que ha comprado; 
por otro lado, información sobre los artículos que ha vendido */
/* Vista op_usuarios_publicacion: para cada publicacion: devuelve las publicaciones que tienen una operacion asociada, junto con
los usuarios asociados a la misma (comprador y vendedor), la descripcion de la publiacion y su categoría */
DROP VIEW IF EXISTS op_usuarios_publicacion;
CREATE VIEW op_usuarios_publicacion AS 
(SELECT Usuarios_idUsuario AS Usuario_vendedor, Usuario_comprador,idPublicacion,descripcion, CategoriaPublicacion_idCategoriaPublicacion
   FROM Publicaciones pub JOIN
   (SELECT Usuarios_idUsuario AS Usuario_comprador, idOperacion,Subastas_Publicaciones_idPublicacion, 
		  Ventas_Publicaciones_idPublicacion,Servicios_Publicaciones_idPublicacion 
	  FROM (SELECT * FROM Operaciones op1 WHERE op1.Pagos_idPago IS NOT NULL) op 
      LEFT JOIN Ofertas of ON op.idOperacion=of.Operaciones_idOperacion
	  LEFT JOIN Contrataciones contr ON op.idOperacion=contr.Operaciones_idOperacion
      LEFT JOIN Compras comp ON op.idOperacion=comp.Operaciones_idOperacion ) z
	ON ( pub.idPublicacion=z.Subastas_Publicaciones_idPublicacion OR
		 pub.idPublicacion=z.Ventas_Publicaciones_idPublicacion OR
		 pub.idPublicacion=z.Servicios_Publicaciones_idPublicacion ));
SET @vendedor = 2;
SET @comprador = 1;
SELECT * FROM op_usuarios_publicacion x WHERE x.Usuario_vendedor = @vendedor;
SELECT * FROM op_usuarios_publicacion x WHERE x.Usuario_comprador = @comprador;

/* Consulta 1b: los artículos que un usuario ha visitado con su fecha de visita */
SET @visitador = 1;
SELECT descripcion FROM Usuarios_Visita_Publicaciones uvp 
	JOIN Publicaciones p 
    ON uvp.Publicaciones_idPublicacion = p.idPublicacion
    WHERE uvp.Usuarios_idUsuario = @visitador;

/* Consulta 1c: los artículos que un usuario tiene en su lista de favoritos*/
SET @usuario = 1;
SELECT descripcion FROM Publicaciones_Favoritas_Usuarios pfu 
	JOIN Publicaciones p 
    ON pfu.Publicaciones_idPublicacion = p.idPublicacion
    WHERE pfu.Usuarios_idUsuario = @usuario;

      
/* Consulta 1d : las primeras 3 categorias que visito con mayor frecuencia en el ultimo año cada usuario */
/* Vista visitas_usuario_por_categoria: devuelve para cada usuario, las veces que visito cada categoria en el ultimo año */
SET @visitador = 1;
DROP VIEW IF EXISTS visitas_usuario_por_categoria;
CREATE VIEW visitas_usuario_por_categoria AS
(SELECT Usuario_visitador, Categoria, COUNT(*) AS Cantidad_visitas FROM
  (SELECT Usuario_visitador, CategoriaPublicacion_idCategoriaPublicacion AS Categoria FROM
   (SELECT Usuarios_idUsuario AS Usuario_visitador,Publicaciones_idPublicacion
   FROM Usuarios_visita_Publicaciones v 
   WHERE YEAR(v.fecha) = YEAR(CURRENT_DATE) - 1) z
   JOIN Publicaciones pub ON pub.idPublicacion=z.Publicaciones_idPublicacion) z
   GROUP BY Usuario_visitador, Categoria
   ORDER BY Cantidad_visitas DESC);

SELECT * FROM visitas_usuario_por_categoria c WHERE c.Usuario_visitador=@visitador;

/* Consulta 2 : vendedores que han publicado artículos de dicha categoría y la cantidad de ventas que efectuó cada uno de dichos vendedores */
SET @categoria = 1;
SELECT Usuario_vendedor, COUNT(*) AS cantidad_ventas FROM
	(SELECT Usuario_vendedor, idPublicacion FROM op_usuarios_publicacion p 
	WHERE p.CategoriaPublicacion_idCategoriaPublicacion = @categoria) z
    JOIN Ventas v
    ON v.Publicaciones_idPublicacion = z.idPublicacion
    GROUP BY Usuario_vendedor;
    
/* Consulta 3 */
DELIMITER //
CREATE PROCEDURE ofertar
       (IN id_subasta INT,
        IN monto    FLOAT,
        IN usuario INT)
BEGIN 
	 IF (monto >= 1 + (SELECT costo_vigente FROM Subastas s WHERE s.idSubasta = id_subasta) AND
        monto <  2 * (SELECT costo_vigente FROM Subastas s WHERE s.idSubasta = id_subasta)) THEN
     BEGIN
		 SET @prox_idOp = (SELECT AUTO_INCREMENT
			FROM  INFORMATION_SCHEMA.TABLES
			WHERE TABLE_SCHEMA = 'mydb'
			AND   TABLE_NAME   = 'Operaciones');
			
		 INSERT INTO Operaciones
			  ( Usuarios_idUsuario, fecha, idOperacion ) 
		 VALUES 
			  ( usuario, CURDATE(),@prox_idOp );
			  
		 INSERT INTO Ofertas
			( Operaciones_idOperacion, Subastas_idSubasta, Subastas_Publicaciones_idPublicacion, monto)
	     VALUES
            (@prox_idOp, id_subasta, (SELECT Publicaciones_idPublicacion FROM Subastas s WHERE s.idSubasta = id_subasta), monto);
     END
END
delimiter ;

CALL ofertar(1,3,1);

/* Consulta 4: obtener para un usuario la lista de preguntas que ha realizado, con las respectivas respuestas que haya recibido */
SET @preguntador = 1;
SELECT pregunta, respuesta FROM Preguntas preg WHERE preg.Usuarios_idUsuario_preguntador = @preguntador;

/* Consulta 5 */
SET @keyword = 'i';
SET @categoria = 1;
SELECT * FROM Publicaciones p WHERE p.descripcion LIKE CONCAT('%',@keyword,'%')
	AND p.CategoriaPublicacion_idCategoriaPublicacion = @categoria;

/* Consulta 6: obtener, para un año específico, el ganador/es del premio e-Khali*/
SET @anio = 2016;
SELECT Usuarios_idUsuario FROM Usuarios_has_PremioKhan uhp WHERE 
	uhp.PremioKhan_anio = @anio;
