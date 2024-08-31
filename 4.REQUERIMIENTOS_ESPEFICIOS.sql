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
FROM TEACHERS
