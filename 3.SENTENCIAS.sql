--Todas las sencias se pueden ejecutar una a una, dado que en así se pueden ver las consultar particularmente
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--¿Qué es la sintaxis del WHERE?
--MULTIPLES FILAS TODAS LAS COLUMNAS
SELECT * FROM TEACHER
WHERE INSTRUCTORID IN (1, 3, 4 , 5)

--CONSULTAR UNICAMENTE AL INSTRUCTOR EN LA FILA 3
SELECT * FROM TEACHER
WHERE TEACHERID = 3

--CONSULTAR TODAS LAS FILAS DIFERENTES A INSTRUCTOR EN LA FILA 3
SELECT * FROM TEACHER
WHERE TEACHERID != 3

--Ahora el criterio de busqueda es el nombre ana, este podría ser más de una coicidencia. Si no estás seguro de que corra así el programa hay que hacer la prueba.
SELECT * FROM TEACHER
WHERE FIRSTNAME = 'Ana' -- Hay que tener cuidado porque si no usas las comillas correctamente o usas doble comilla es un error de sintaxis

--Consultar como si se empieza con Ana, es un criterio abiero, para lo declarado por defecto en el documento 2. concordara con 2 teachers
SELECT * FROM TEACHER
WHERE FIRSTNAME LIKE 'Ana%'

--USAR EL COMPARADOR < > ECT
SELECT * FROM TEACHER
WHERE SALARY < 100000

--Para determinar un rango podemos usar la siguiente sentencia
SELECT * FROM TEACHER
WHERE SALARY BETWEEN 10000 and  90000
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Cláusulas de Comparación Textual en SQL (AND, NULL, IN, NOT)
--AND
SELECT * FROM TEACHER
WHERE SALARY BETWEEN 10000 AND  90000 AND FIRSTNAME LIKE 'j%'

--OR
SELECT * FROM TEACHER
WHERE SALARY BETWEEN 10000 AND  90000 OR FIRSTNAME LIKE 'j%'

--Multiples condicones
SELECT * FROM TEACHER
WHERE 
SALARY BETWEEN 43000 AND  48000 
AND age BETWEEN 20 and 48 
OR FIRSTNAME LIKE '%r%'

--DETECTAR CONDICIONES NULAS NULL
SELECT * FROM TEACHER
WHERE FIRSTNAME IS NOT NULL  -- PARA DETECTAR CONDICION NORMAL

SELECT * FROM TEACHER
WHERE FIRSTNAME IS NULL  -- PARA DETECTAR CONDICION DONDE LOS DATOS NO SEAN CORRECTO

--CONDICION LOGICA PARA VALORES NUMERICOS
SELECT * FROM STUDENTS
WHERE AGE NOT IN (20) --ARROJA TODOS LOS VALORES QUE DIFERENTES DE 20, PODRIA SER SIMILAR A LA SENTENCIA "WHERE AGE != 20"
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Funciones de Aritmética Básica en SQL (COUNT, SUM, AVG)




