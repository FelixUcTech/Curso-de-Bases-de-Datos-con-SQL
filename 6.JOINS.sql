--Los joins nos permiten relacionar dos o más tablas de ellas
--Existen distintos tipos de joins:
  --Inner Join
  --Left Join 
  --Right Join
  --Full Outer Join 
  --Cross Join
-----------------------
--Inner Join: 
--Tabla 1 y Tabla 2, la coicidencias son las que se muestran, es decir, los campos que se muestran son los que tienen relación entre las dos tablas.
--Left Join:
SELECT students.name, enrollments.course
FROM students
INNER JOIN enrollments ON students.student_id = enrollments.student_id;
--
SELECT students.name, enrollments.course
FROM students
INNER JOIN enrollments ON students.student_id = enrollments.student_id
WHERE enrollments.course = 'Historia';
--
SELECT students.name, enrollments.course, courses.teacher
FROM students
INNER JOIN enrollments ON students.student_id = enrollments.student_id
INNER JOIN courses ON enrollments.course = courses.course;

--Nos retorna únicamente la información que se encuentre presente en las dos tablas, y adicionalmente toda la información que se encunetre presente en la tabla que posicionaste al lado izquierdo de la consulta
--Rigth join es lo mismo que el left join solo que la información que viene de manera total sería la tabla de la derecha, y las coicidencias serían de la izquierda
--Características Clave del FULL OUTER JOIN:
--Incluye todas las filas: Devuelve todas las filas de ambas tablas. Si no hay una coincidencia en una tabla, las filas de esa tabla aún se muestran en el resultado, con valores nulos en las columnas de la otra tabla.
--Coincidencias y no coincidencias: Muestra tanto las filas coincidentes (donde las filas de ambas tablas cumplen la condición de la unión) como las no coincidentes (donde una fila de una tabla no tiene una coincidencia correspondiente en la otra tabla).
--El cross join, es un producto en función de las coincidencias de cada fila de la tabla A con la Tabla b


-- Selecciona todos los campos de las tablas PRODUCTO y MARCA
SELECT *
-- Realiza un INNER JOIN entre las tablas PRODUCTO y MARCA
FROM PRODUCTO 
-- Especifica la condición de unión
INNER JOIN MARCA 
-- La condición de unión es que el MARCA_ID en PRODUCTO debe ser igual al IDMARCA en MARCA
ON PRODUCTO.MARCA_ID = MARCA.IDMARCA;

--Referenciación Entre producto y p falta AS, pero en este caso se da la opción de no específicarla, lo mismo aplica con marca
-- Selecciona todos los campos de las tablas PRODUCTO y MARCA
SELECT *
-- Realiza un INNER JOIN entre las tablas PRODUCTO y MARCA
FROM PRODUCTO P
-- Especifica la condición de unión
INNER JOIN MARCA M
-- La condición de unión es que el MARCA_ID en PRODUCTO debe ser igual al IDMARCA en MARCA
ON P.MARCA_ID = M.IDMARCA;

-- Selecciona todos los campos de las tablas PRODUCTO y MARCA
SELECT p.IDPRODUCTO, p.NOMBRE, m.IDMARCA, m.NOMBRE
-- Realiza un INNER JOIN entre las tablas PRODUCTO y MARCA
FROM PRODUCTO P
-- Especifica la condición de unión
INNER JOIN MARCA M
-- La condición de unión es que el MARCA_ID en PRODUCTO debe ser igual al IDMARCA en MARCA
ON P.MARCA_ID = M.IDMARCA;
--Esto es una mala práctica, para no regresar en los cambios y verficar a que hace referencia, por ello es importante desde un inicio revisar bien el nombre de la tabla a la que hacemos referencia.







