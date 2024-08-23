-- 1. Búsqueda por coincidencia de patrones al inicio
SELECT * FROM TEACHER WHERE FIRSTNAME LIKE 'Ana%';
-- Resultado: Todos los nombres que comienzan con "Ana" (como "Ana", "Anabella", "Anastasia", etc.).

-- 2. Búsqueda por coincidencia de patrones al final
SELECT * FROM TEACHER WHERE LASTNAME LIKE '%ez';
-- Resultado: Todos los apellidos que terminan con "ez" (como "Pérez", "Gómez", "Sánchez", etc.).

-- 3. Búsqueda por coincidencia en cualquier parte del texto
SELECT * FROM TEACHER WHERE EMAIL LIKE '%@example.com';
-- Resultado: Todos los correos electrónicos que contienen "@example.com".

-- 4. Búsqueda por coincidencia de un solo carácter
SELECT * FROM TEACHER WHERE FIRSTNAME LIKE 'A_a';
-- Resultado: Todos los nombres que tienen "A" en la primera posición, cualquier letra en la segunda, y "a" en la tercera (como "Ana", "Ama", "Ada", etc.).
-- Se respeta la cantidad de guiones bajo correspondiendo al número de caracters que podrían sustituirse en el filtro

-- 5. Búsqueda por coincidencia de un rango de caracteres
SELECT * FROM TEACHER WHERE FIRSTNAME LIKE '[A-C]%';
-- Resultado: Todos los nombres que comienzan con las letras "A", "B" o "C" (como "Ana", "Carlos", "Beatriz", etc.).

-- 6. Búsqueda excluyendo un rango de caracteres
SELECT * FROM TEACHER WHERE FIRSTNAME LIKE '[^A-C]%';
-- Resultado: Todos los nombres que no comienzan con las letras "A", "B" o "C".

-- 7. Búsqueda combinada de patrones
SELECT * FROM TEACHER WHERE FIRSTNAME LIKE 'Ana%' OR LASTNAME LIKE '%ez';
-- Resultado: Todos los registros donde el primer nombre comienza con "Ana" o el apellido termina con "ez".

-- 8. Búsqueda usando caracteres especiales
SELECT * FROM TEACHER WHERE EMAIL LIKE '%\_admin%' ESCAPE '\';
-- Resultado: Todos los correos electrónicos que contienen "_admin" como parte del texto.

-- 9. Búsqueda utilizando patrones complejos con varias condiciones
SELECT * FROM TEACHER 
WHERE (FIRSTNAME LIKE 'A%' AND LASTNAME LIKE '%z') 
OR (EMAIL LIKE '%@domain.com');
-- Resultado: Todos los registros donde el primer nombre comienza con "A" y el apellido termina en "z", o donde el correo electrónico pertenece al dominio "@domain.com".
