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

--LA MEJOR ANALOGIA PARA EL INNER JOIN ES UNA UNION DE FILAS Y REFERENCIACIÓN A TRAVEZ DE LA RELACIÓN EN EL ON, ES COMO UN IMAN QUE RALACIONA PARA LOS CAMPOS IGUALES.
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

-- Selecciona el nombre del producto y el nombre de la marca, utilizando alias para la columna de marca
SELECT PRODUCTO.NOMBRE, MARCA.NOMBRE AS 'Nombre de marca'
-- Especifica la tabla principal de la cual se obtendrán los datos
FROM PRODUCTO
-- Realiza un INNER JOIN entre la tabla PRODUCTO y la tabla MARCA
INNER JOIN MARCA ON PRODUCTO.MARCA_ID = MARCA.IDMARCA;
-- Selecciona los nombres de productos y los nombres de sus respectivas marcas.
SELECT PRODUCTO.NOMBRE AS Producto_Nombre, MARCA.NOMBRE AS Marca_Nombre
FROM PRODUCTO
-- Realiza un LEFT JOIN entre las tablas PRODUCTO y MARCA.
LEFT JOIN MARCA ON PRODUCTO.MARCA_ID = MARCA.IDMARCA;
-- Explicación:
-- El LEFT JOIN selecciona todas las filas de la tabla PRODUCTO y las filas coincidentes de la tabla MARCA.
-- Si no hay coincidencia (es decir, si un producto no tiene marca asociada), se rellenan con NULL las columnas de la tabla MARCA.

-- Selecciona los nombres de productos y los nombres de sus respectivas marcas.
SELECT PRODUCTO.NOMBRE AS Producto_Nombre, MARCA.NOMBRE AS Marca_Nombre
FROM PRODUCTO
-- Realiza un RIGHT JOIN entre las tablas PRODUCTO y MARCA.
RIGHT JOIN MARCA ON PRODUCTO.MARCA_ID = MARCA.IDMARCA;
-- Explicación:
-- El RIGHT JOIN selecciona todas las filas de la tabla MARCA y las filas coincidentes de la tabla PRODUCTO.
-- Si no hay coincidencia (es decir, si una marca no tiene productos asociados), se rellenan con NULL las columnas de la tabla PRODUCTO.
-- Nota: En algunos sistemas de gestión de bases de datos como SQLite, no se soporta directamente RIGHT JOIN.

-- Selecciona los nombres de productos y los nombres de sus respectivas marcas.
SELECT PRODUCTO.NOMBRE AS Producto_Nombre, MARCA.NOMBRE AS Marca_Nombre
FROM PRODUCTO
-- Realiza un FULL OUTER JOIN entre las tablas PRODUCTO y MARCA.
FULL OUTER JOIN MARCA ON PRODUCTO.MARCA_ID = MARCA.IDMARCA;
-- Explicación:
-- El FULL OUTER JOIN selecciona todas las filas tanto de la tabla PRODUCTO como de la tabla MARCA.
-- Si un producto no tiene una marca asociada, Marca_Nombre será NULL.
-- Si una marca no tiene un producto asociado, Producto_Nombre será NULL.
-- Nota: SQLite no soporta directamente FULL OUTER JOIN, se debe emular usando LEFT JOIN y RIGHT JOIN combinados con UNION ALL.

-- Selecciona todas las filas de PRODUCTO con las marcas correspondientes.
SELECT PRODUCTO.NOMBRE AS Producto_Nombre, MARCA.NOMBRE AS Marca_Nombre
FROM PRODUCTO
LEFT JOIN MARCA ON PRODUCTO.MARCA_ID = MARCA.IDMARCA
UNION ALL
-- Selecciona todas las filas de MARCA que no tienen un producto asociado.
SELECT PRODUCTO.NOMBRE AS Producto_Nombre, MARCA.NOMBRE AS Marca_Nombre
FROM MARCA
LEFT JOIN PRODUCTO ON PRODUCTO.MARCA_ID = MARCA.IDMARCA
WHERE PRODUCTO.MARCA_ID IS NULL;
-- Explicación:
-- El primer SELECT con LEFT JOIN obtiene todas las combinaciones de PRODUCTO y MARCA donde hay coincidencias.
-- El segundo SELECT con LEFT JOIN y WHERE PRODUCTO.MARCA_ID IS NULL selecciona las filas de MARCA que no tienen coincidencia en PRODUCTO.
-- UNION ALL combina ambos resultados para emular un FULL OUTER JOIN.

