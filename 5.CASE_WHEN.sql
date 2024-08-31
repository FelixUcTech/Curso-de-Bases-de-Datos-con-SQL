--CASE / WHEN, con base en un criterio de información, que puede ser una regla o muchas necesitamos, aplicar un escenario específico.
--Resumen de la estructura CASE | WHEN | THEN | ELSE | END
SELECT age, CASE WHEN age BETWEEN 17 AND 20 THEN 'TEAM A' ELSE 'TEAM B' END
FROM STUDENTS
GROUP BY AGE
--OTRA FORMA -- Seleccionar la edad de los estudiantes y asignarles un equipo basado en su edad
SELECT age, 
       -- Usar una expresión CASE para asignar un equipo basado en el rango de edad
       CASE 
           WHEN age BETWEEN 17 AND 20 THEN 'TEAM A'  -- Si la edad está entre 17 y 20 (inclusive), asignar 'TEAM A'
           ELSE 'TEAM B'  -- Para todas las demás edades, asignar 'TEAM B'
       END
FROM STUDENTS
-- Agrupar los resultados por edad para consolidar los datos por cada valor de edad
GROUP BY age;
