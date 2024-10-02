# Preliminares

- [Preliminares](#preliminares)
    - [Conceptos claves](#conceptos-claves)
        - [CRUD](#crud)
        - [WHERE](#where)
        - [Business Intelligence (BI)](#business-intelligence-bi)
## Conceptos claves
### CRUD
El CRUD, acrónimo de "Create, Read, Update, Delete", es un conjunto de operaciones básicas que se realizan en cualquier sistema de gestión de bases de datos.

💡 Recuerda que puedes usar el comando INSERT INTO para insertar un nuevo registro en una tabla. Para ejecutar una consulta INSERT lo puedes hacer de la siguiente manera:

```sql
INSERT INTO table (column1,column2 ,..) VALUES( value1, value2 ,...);
```

💡 Recuerda que puedes usar el comando DELETE FROM para eliminar un registro en una tabla. Para ejecutar una consulta DELETE lo puedes hacer de la siguiente manera: 

```sql
 DELETE FROM table WHERE condition;
```

💡 Recuerda que puedes usar el comando UPDATE para actualizar un registro en una tabla. Para ejecutar una consulta UPDATE lo puedes hacer de la siguiente manera: 

```sql
UPDATE table SET column1 = value1, column2 = value2, ... WHERE condition;
```

### WHERE

Cuando tenemos dudas de donde consultar, es importnate entender que el where acota el alcance de nuestro analisis, esto puede estar dado por las reglas del negocio o los requerimientos del cliente
SELECT
Aplica que no siempre es necesario hacer la extracción de todas las columnas para nuestro analisis y cuando hablamos de BIGDATA  es prudente no hacer una consulta tan general.

### Business Intelligence (BI)

Business Intelligence (BI), o Inteligencia de Negocios en español, es un conjunto de estrategias, tecnologías, aplicaciones y procesos que se utilizan para recolectar, integrar, analizar y presentar datos empresariales. El objetivo de la BI es ayudar a las organizaciones a tomar decisiones informadas basadas en datos.

¿Qué implica Business Intelligence?
Recolección de datos: BI implica reunir datos de varias fuentes de la empresa, como sistemas de ventas, CRM, ERP, hojas de cálculo, y más. Esto puede incluir datos financieros, datos de ventas, datos de producción, etc.

Almacenamiento de datos: Los datos recolectados se almacenan en bases de datos o almacenes de datos (data warehouses), que están diseñados para facilitar el análisis y la recuperación eficiente de la información.

Transformación y limpieza de datos: Los datos brutos a menudo se limpian y transforman para garantizar que estén completos, precisos y en un formato adecuado para el análisis.

Análisis de datos: Una vez que los datos están preparados, se utilizan diversas técnicas de análisis para descubrir patrones, tendencias y relaciones. Esto puede incluir análisis estadístico, minería de datos (data mining), análisis predictivo, y análisis de big data.

Visualización de datos: Los resultados del análisis se presentan en formatos comprensibles y fáciles de interpretar, como dashboards (tableros de control), gráficos, informes, y cuadros. Las herramientas de visualización de datos ayudan a los usuarios a ver tendencias, patrones y detalles en los datos.

Toma de decisiones: Con BI, las organizaciones pueden tomar decisiones basadas en datos precisos y actuales, lo que puede llevar a mejoras en la eficiencia operativa, la satisfacción del cliente, la rentabilidad, y otras áreas clave.

¿Por qué es importante Business Intelligence?
Mejora la toma de decisiones: Permite a los gerentes y líderes de una empresa tomar decisiones más informadas y basadas en datos.
Aumenta la eficiencia operativa: Ayuda a identificar áreas de mejora en los procesos de negocio.
Identificación de oportunidades de negocio: Detecta nuevas oportunidades de mercado y permite a la empresa mantenerse competitiva.
Seguimiento de rendimiento: Permite a las empresas monitorear sus objetivos y métricas de rendimiento clave (KPIs) en tiempo real.
Herramientas de Business Intelligence
Algunas de las herramientas más populares de BI incluyen:

Tableau: Conocido por sus capacidades de visualización de datos.
Power BI: Una herramienta de Microsoft que integra BI con otras aplicaciones de Office.
QlikView: Ofrece análisis de datos intuitivos y visualizaciones interactivas.
SAP BusinessObjects: Una suite de aplicaciones de BI para un análisis amplio.
Looker: Una plataforma de análisis de datos que trabaja bien con grandes volúmenes de datos y múltiples fuentes.
En resumen, Business Intelligence permite a las empresas transformar datos en información accionable, lo que les ayuda a tomar decisiones estratégicas y tácticas más efectivas.

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
La cláusula GROUP BY en SQL se utiliza para agrupar filas que tienen valores idénticos en una o más columnas y permite realizar cálculos agregados en cada grupo, como sumas, promedios, conteos, etc.

¿Cómo funciona GROUP BY?
Agrupación de datos: GROUP BY agrupa los resultados de una consulta SQL en grupos basados en uno o más columnas especificadas. Cada grupo contiene todas las filas que tienen el mismo valor en las columnas seleccionadas para la agrupación.

Cálculos agregados: Después de agrupar los datos, se pueden aplicar funciones de agregación como SUM(), COUNT(), AVG(), MIN(), y MAX() para realizar cálculos en cada grupo.

Ejemplo básico de uso
Supongamos que tenemos una tabla llamada SALES con las columnas ProductID, Quantity, y Price. Si queremos saber cuántas unidades de cada producto se han vendido, usaríamos GROUP BY junto con la función SUM():

SELECT ProductID, SUM(Quantity) AS TotalSold
FROM SALES
GROUP BY ProductID;

Explicación del ejemplo:

SELECT ProductID, SUM(Quantity) AS TotalSold: Selecciona la columna ProductID y calcula la suma de Quantity para cada producto.
FROM SALES: Especifica la tabla de la que se están obteniendo los datos.
GROUP BY ProductID: Agrupa las filas de la tabla SALES por cada ProductID, de manera que el cálculo de SUM(Quantity) se realiza para cada grupo de ProductID.
El resultado de esta consulta será una lista de cada ProductID con la cantidad total vendida, agrupando todos los registros que corresponden al mismo producto.
----------------------------------------------------------------------------------------------------------------
El HAVING en SQL es una cláusula que se utiliza para filtrar los resultados de una consulta después de que se han agrupado con la cláusula GROUP BY.

Conceptos Básicos:
GROUP BY: Agrupa las filas que tienen los mismos valores en columnas específicas en conjuntos de filas resumidos, como calcular la suma o el promedio de un grupo.

HAVING: Se utiliza para filtrar estos grupos creados por GROUP BY basándose en condiciones específicas.

¿Por Qué Necesitamos HAVING?
Imagina que quieres contar cuántos estudiantes hay en cada curso en una escuela. Usas GROUP BY para agrupar los estudiantes por curso. Luego, si solo te interesan los cursos con más de 10 estudiantes, necesitas filtrar esos grupos. Ahí es donde entra HAVING.

Ejemplo Paso a Paso:
Supongamos que tienes una tabla llamada STUDENT_COURSE que tiene las columnas COURSEID (el ID del curso) y STUDENTID (el ID del estudiante). Quieres saber cuántos estudiantes hay en cada curso, pero solo mostrar los cursos que tienen más de 10 estudiantes.

SELECT COURSEID, COUNT(STUDENTID) AS STUDENT_COUNT
FROM STUDENT_COURSE
GROUP BY COURSEID
HAVING COUNT(STUDENTID) > 10;

Explicación del Ejemplo:
SELECT COURSEID, COUNT(STUDENTID) AS STUDENT_COUNT:

Selecciona el ID del curso (COURSEID) y el número de estudiantes en cada curso (COUNT(STUDENTID)), renombrado como STUDENT_COUNT.
FROM STUDENT_COURSE:

Indica que estamos tomando los datos de la tabla STUDENT_COURSE.
GROUP BY COURSEID:

Agrupa los resultados por COURSEID, es decir, todos los estudiantes en el mismo curso se agrupan juntos.
HAVING COUNT(STUDENTID) > 10:

Filtra estos grupos para mostrar solo aquellos cursos donde el número de estudiantes es mayor que 10.
Diferencia entre WHERE y HAVING:
WHERE: Se utiliza para filtrar filas antes de agruparlas con GROUP BY.
HAVING: Se utiliza para filtrar los grupos creados por GROUP BY.
Resumen:
HAVING se usa para aplicar condiciones a los grupos creados después de usar GROUP BY.
Útil cuando necesitas filtrar resultados agregados, como sumas, conteos o promedios.
No puede ser utilizado sin GROUP BY.
En resumen, HAVING es como un filtro especial que solo funciona después de agrupar tus datos.
------------------------------------------------------------------------------------------------------------------------
-- Aspectos Positivos de MySQL Workbench:

-- 1. Interfaz Gráfica Intuitiva:
--    - MySQL Workbench ofrece una interfaz gráfica amigable y fácil de usar.
--    - Simplifica tareas como la creación, modificación y eliminación de tablas, vistas y procedimientos almacenados.
--    - Es ideal para quienes prefieren una herramienta visual sobre la línea de comandos.

-- 2. Modelo de Diseño de Bases de Datos:
--    - Permite crear diagramas ERD (Entidad-Relación) para diseñar bases de datos visualmente.
--    - Puedes exportar modelos a SQL y generar diagramas a partir de bases de datos existentes.

-- 3. Compatibilidad con Múltiples Plataformas:
--    - MySQL Workbench está disponible en Windows, macOS y Linux, permitiendo acceso a una amplia gama de usuarios.

-- 4. Soporte para Consultas SQL:
--    - Incluye un editor SQL con resaltado de sintaxis y autocompletado, lo que facilita la creación de consultas.
--    - Permite ejecutar, escribir y optimizar consultas SQL directamente desde la herramienta.

-- 5. Funciones de Administración:
--    - Ofrece herramientas para gestionar usuarios, permisos, realizar copias de seguridad, restaurar bases de datos y monitorear el rendimiento del servidor MySQL.

-- 6. Integración de Copias de Seguridad y Restauración:
--    - Proporciona herramientas para realizar backups y restaurar bases de datos sin necesidad de línea de comandos.

-- Aspectos Negativos de MySQL Workbench:

-- 1. Rendimiento Lento con Grandes Bases de Datos:
--    - Puede volverse lento y consumir muchos recursos cuando se trabaja con bases de datos grandes o complejas.
--    - El rendimiento puede disminuir al cargar grandes volúmenes de datos o trabajar con diagramas ERD extensos.

-- 2. Errores y Fallos Ocasionales:
--    - Algunos usuarios reportan que MySQL Workbench puede cerrarse inesperadamente o presentar errores en ciertos sistemas operativos.

-- 3. Limitaciones en la Personalización:
--    - MySQL Workbench tiene menos opciones de personalización en comparación con otras herramientas avanzadas de gestión de bases de datos.

-- 4. Consumo de Recursos:
--    - Puede ser intensivo en el consumo de recursos del sistema, especialmente cuando se ejecutan varias consultas complejas o se manejan grandes modelos ERD.

-- 5. Falta de Soporte para Otros Motores de Bases de Datos:
--    - Está diseñado específicamente para MySQL y MariaDB, por lo que no ofrece soporte nativo para otros motores de bases de datos como PostgreSQL o SQL Server.

-- 6. Funciones Avanzadas para Desarrolladores:
--    - Aunque es completo, no incluye algunas funciones avanzadas como la depuración o herramientas de profiling detalladas, que algunos desarrolladores avanzados podrían necesitar.

-- Resumen:

-- Lo bueno:
--   - Interfaz gráfica amigable.
--   - Soporte para modelado de bases de datos y consultas SQL.
--   - Herramientas de administración integradas.
--   - Disponible en múltiples plataformas.

-- Lo malo:
--   - Puede volverse lento con bases de datos grandes.
--   - Puede fallar ocasionalmente.
--   - Consume muchos recursos del sistema.
--   - Está limitado a bases de datos MySQL/MariaDB.
------------------------------------------------------------------------------------------------------------------------

```sql
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
---------------------------------------------------------------------------------------------------------------------------
--UPDATE COURSES 
--El ejemplo manda a llamar la Tabla COURSES
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



```