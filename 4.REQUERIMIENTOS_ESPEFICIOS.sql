--Esta práctica representa un requermiento de información de acuerdo a la base de datos que estamos trabajando.
--De la clase de funciones Arimética Básicas en SQL (COUNT, SUM, AVG)
SELECT COURSEID, COUNT(STUDENTID)
FROM STUDENT_COURSE
GROUP BY COURSEID


