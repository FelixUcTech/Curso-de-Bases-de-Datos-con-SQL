--Esta práctica representa un requermiento de información de acuerdo a la base de datos que estamos trabajando.

-- Consulta 1: Obtener el número de estudiantes inscritos en cada curso
SELECT COURSESID, COUNT(STUDENTID) AS STUDENT_COUNT
FROM STUDENT_COURSE
GROUP BY COURSESID;
-- Esta consulta selecciona el COURSEID y cuenta cuántos STUDENTID están asociados con cada curso.
-- GROUP BY COURSEID asegura que el conteo se haga para cada curso por separado.

-- Consulta 2: Obtener el número de cursos en los que cada estudiante está inscrito
SELECT STUDENTID, COUNT(COURSESID) AS COURSES_COUNT
FROM STUDENT_COURSE
GROUP BY STUDENTID;
-- Esta consulta selecciona el STUDENTID y cuenta cuántos COURSESID están asociados con cada estudiante.
-- GROUP BY STUDENTID asegura que el conteo se haga para cada estudiante por separado.

-- Seleccionamos el identificador del curso (COURSESID) y el número de estudiantes inscritos en cada curso.
-- La función COUNT(STUDENTID) cuenta el número de veces que aparece STUDENTID para cada COURSESID, es decir, el número de estudiantes inscritos en cada curso.
-- La cláusula GROUP BY agrupa los resultados por COURSESID, lo que significa que COUNT(STUDENTID) se calcula para cada grupo de COURSESID.
SELECT COURSESID, COUNT(STUDENTID) AS STUDENT_COUNT
FROM STUDENT_COURSE
-- Agrupamos los resultados por COURSESID, para obtener el conteo de estudiantes por curso.
GROUP BY COURSESID
-- La cláusula HAVING filtra los resultados agregados por GROUP BY. En este caso, seleccionamos solo los cursos que tienen más de 6 estudiantes inscritos.
-- El primer filtro es COUNT(STUDENTID) > 6, que selecciona solo aquellos cursos donde el número de estudiantes es mayor que 6.
-- El segundo filtro parece incompleto. Si se pretende usar COUNT(STUDENTID) para una comparación adicional, la condición debe especificarse claramente.
HAVING COUNT(STUDENTID) > 6 OR COUNT(STUDENTID) -- Este filtro está incompleto. En SQL, la cláusula HAVING debe tener una condición completa. Debe especificar qué condición adicional se quiere aplicar a COUNT(STUDENTID).

--Ahora debemos sacar el total de los salarios de los instructores
SELECT SUM(SALARY)
FROM TEACHER

-- Esta consulta SQL calcula la suma total de los salarios de todos los profesores en la tabla TEACHER.
SELECT SUM(SALARY) as "Nomina total"  -- SUM(SALARY) suma todos los valores en la columna SALARY. "Nomina total" es el alias que se usa para mostrar el resultado de manera más descriptiva.
FROM TEACHER;  -- Indica que los datos se están obteniendo de la tabla TEACHER.

--Lo siguientes comandos son muy utilies en el control de inventarios.
-- Esta consulta selecciona la edad mínima y máxima de los estudiantes
SELECT MIN(age) AS "MINIMUN AGE",  -- Utiliza la función MIN para encontrar la edad más baja en la columna age
       MAX(AGE) AS "MAXIMUM AGE"   -- Utiliza la función MAX para encontrar la edad más alta en la columna age
FROM STUDENTS;                     -- Indica que las funciones se aplican a la tabla STUDENTS

-- Esta consulta selecciona la edad y la edad redondeada de cada estudiante en la tabla STUDENTS
SELECT age,                    -- Selecciona la columna age de la tabla STUDENTS
       ROUND(age)              -- Utiliza la función ROUND para redondear el valor de age al número entero más cercano
FROM STUDENTS;                 -- Indica que los datos se obtienen de la tabla STUDENTS
-- Esta consulta selecciona el salario y el salario redondeado de cada maestro en la tabla TEACHER
SELECT salary,                -- Selecciona la columna salary de la tabla TEACHER para mostrar los salarios originales de cada maestro
       ROUND(salary)          -- Utiliza la función ROUND para redondear el valor de salary al número entero más cercano
FROM TEACHER;                 -- Indica que los datos se obtienen de la tabla TEACHER

 -- Seleccionar los cursos y contar el número de estudiantes registrados en cada curso
SELECT coursesid, COUNT(studentid) AS "Alumnos_registrados"
FROM STUDENT_COURSE
-- Agrupar los resultados por el ID del curso para contar estudiantes por curso
GROUP BY coursesid
-- Filtrar los resultados para mostrar solo aquellos cursos con 4 o más estudiantes,
-- o aquellos con exactamente 1 estudiante registrado
HAVING COUNT(studentid) >= 4 
       OR COUNT(studentid) = 1;
