--Para poder actualizar un datos
UPDATE COURSES --El ejemplo manda a llamar la Tabla COURSES
SET COURSESNAME= "Matemática Avanzada" --Si solo dejamos esta instrucción el nombre de todos los cursos podría sobre escribirse por eso siempre es necesrio especificar donde estamos seteando ese nuevo valor
WHERE COURSESNAME= "Matemáticas Avanzadas" -- Valor previo al cambio
-- Normalmente esta clase de actualizaciones, se debería hacer por la primary key

--Posteriormente sería bien consultar la tabla para que quede verificado y validado el comando mediente
SELECT * FROM COURSES;

--ELIMINAR DE DATOS CON SQL (DELETE) 
-- SI NO ENTIENDES ESTOS TERMINOS SERÁ PRELIGROSO, Y SI NO LO HACEMOS BIEN PODRÍAMOS PERDER EL TRABAJO
--SINTAXIS DELETE *  FROM USERS   + WHERE,  el WHERE es lo más importante, señala donde vamos a eliminar, si no usamos esa palabra nos va mal, estaríamos eliminando toda la tabla
--SINTAXIS DELETE *  FROM USERS   + WHERE
--SINTAXIS DELETE *  FROM USERS   + GROUP BY
--SINTAXIS DELETE *  FROM USERS   + ORDER BY
--SINTAXIS DELETE *  FROM USERS   + HAVING 


CREATE TABLE PRODUCTO (
    PKPRODUCTO INT PRIMARY KEY,  -- Identificador único del producto (clave primaria)
    IDPRODUCTO VARCHAR(20),      -- Identificador del producto (cadena de hasta 20 caracteres)
    DESCRIPCION TEXT             -- Descripción del producto (texto largo)
);

