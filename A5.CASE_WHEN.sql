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

SELECT age,  -- Selecciona la columna 'age' de la tabla STUDENTS.
       firstname,  -- Selecciona la columna 'firstname' de la tabla STUDENTS.   
       -- Utiliza la expresión CASE para asignar un equipo basado en condiciones específicas.
       CASE 
           WHEN age BETWEEN 18 AND 22 AND firstname LIKE 'ANA' THEN 'TEAM A'
           -- Asigna 'TEAM A' si la edad está entre 18 y 22 (inclusive) y el nombre es exactamente 'ANA'.
           WHEN age BETWEEN 17 AND 20 THEN 'TEAM B'
           -- Asigna 'TEAM B' si la edad está entre 17 y 20 (inclusive), sin considerar el nombre.
           WHEN age BETWEEN 21 AND 25 AND firstname LIKE 'D%' THEN 'TEAM C'
           -- Asigna 'TEAM C' si la edad está entre 21 y 25 (inclusive) y el nombre empieza con 'D'.
           WHEN age BETWEEN 21 AND 25 THEN 'TEAM D'
           -- Asigna 'TEAM D' si la edad está entre 21 y 25 (inclusive), sin considerar el nombre.
           ELSE 'TEAM E'
           -- Si ninguna de las condiciones anteriores se cumple, asigna 'TEAM E'.
       END AS Team_Assignment  -- Nombramos la columna resultante como 'Team_Assignment'.
FROM STUDENTS  -- De la tabla 'STUDENTS'.
GROUP BY age, firstname;  -- Agrupamos los resultados por 'age' y 'firstname' para consolidar los datos por cada combinación única de edad y nombre.
