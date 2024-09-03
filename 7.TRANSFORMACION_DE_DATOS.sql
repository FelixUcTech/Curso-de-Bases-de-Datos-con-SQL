-- VISTAS TEMPORALES
-- Una vista temporal en SQL es como una "ventana" a través de la cual puedes ver datos de una o más tablas.
-- Piensa en una vista temporal como una "foto instantánea" que muestra datos en tiempo real según se encuentran en las tablas originales.
-- Cuando creas una vista temporal, no se guardan los datos físicamente en ningún lugar. En cambio, la vista siempre refleja el estado actual de los datos en las tablas.
-- Esto significa que si los datos en las tablas originales cambian, la vista temporal también mostrará esos cambios.
-- Las vistas temporales son útiles para simplificar consultas complejas o para mostrar datos de una manera más conveniente.

-- TABLAS TEMPORALES
-- Una tabla temporal es como un "cuaderno de borrador" donde puedes almacenar datos de forma temporal durante una sesión de trabajo.
-- Imagina que estás en una cocina y necesitas un tazón extra para preparar los ingredientes antes de cocinarlos. Una tabla temporal es como ese tazón extra.
-- Las tablas temporales solo existen durante la sesión o transacción en la que se crearon. Una vez que cierras la sesión o la transacción, las tablas temporales desaparecen.
-- Esto es útil cuando necesitas manipular datos temporalmente, como cuando estás haciendo cálculos intermedios que no necesitas guardar permanentemente en la base de datos.

-- VISTAS MATERIALIZADAS
-- Una vista materializada es como una "fotografía impresa" de los datos en una o más tablas. A diferencia de las vistas temporales, las vistas materializadas almacenan los resultados de la consulta en la base de datos.
-- Piensa en una vista materializada como una "captura de pantalla" que guarda una copia de los datos en un momento específico.
-- Los datos en una vista materializada no cambian automáticamente cuando las tablas subyacentes cambian. En cambio, necesitas "refrescar" la vista para que los datos se actualicen.
-- Las vistas materializadas son útiles cuando tienes consultas que son costosas en términos de tiempo y recursos, ya que permiten acceder rápidamente a los resultados previamente calculados.

--VISTAS -- En el código siguiente estamos haciendo referencia a toda la informacón, pero la función de la vista es solo llamar lo que nos interesa
--Un uso importante de la vista es la seguridad, para que no este a disposicón toda la información para ciertos usuarios.
CREATE VIEW VM_STUDENTS AS 
SELECT * FROM STUDENTS;

--Modificar la vista se requiere la siguiente palabra reservada, REPLACE
CREATE OR REPLACE VIEW VW_STUDENTS AS
SELECT STUDENTID, FIRSTNAME, LASTNAME
FROM STUDENTS;

--Si el motor de base de datos no actualiza la vista, otra opción es eliminar la vista, con:
DROP VIEW VM_STUDENTS
--Luego crearla con la información escencial que requieres
CREATE VIEW VM_STUDENTS
SELECT STUDENTID, FIRSTNAME, LASTNAME
FROM STUDENTS;

--VISTAS MATERIALIZADAS EN SQL
CREATE VIEW VW_STUDENTS AS
--Hay funcionalidades muy diferentes para AS, y esta es una de ellas.
SELECT * FROM STUDENTS;

--CREATE INDEX:
--CREATE INDEX se utiliza para crear un índice en una tabla de una base de datos. Los índices son estructuras de datos que mejoran la velocidad de las consultas al permitir un acceso más rápido a los registros de una tabla. Cuando se ejecuta una consulta que busca registros basados en los valores de ciertas columnas, el motor de la base de datos puede utilizar un índice asociado a esas columnas para buscar y recuperar los registros de manera más eficiente.
--Un ejemplo simple de CREATE INDEX sería:
CREATE INDEX idx_lastname ON STUDENTS (LASTNAME);
--Este comando crea un índice llamado idx_lastname en la tabla STUDENTS, utilizando la columna LASTNAME. Esto sería útil si la tabla tiene un gran número de registros y se ejecutan consultas frecuentes que buscan estudiantes por su apellido.

--TRIGGER:
--Un trigger en SQL es un tipo de procedimiento almacenado que se ejecuta automáticamente cuando se produce un evento en una tabla o vista. Los eventos que pueden activar un trigger incluyen inserciones, actualizaciones o eliminaciones de registros en la tabla a la que está asociado el trigger.
--Los triggers son útiles para aplicar reglas de negocio, mantener la integridad de los datos o realizar acciones adicionales en la base de datos cuando se realizan ciertas operaciones.
--Aquí hay un ejemplo de cómo crear un trigger en SQL:
CREATE TRIGGER update_salary
AFTER UPDATE ON EMPLOYEES
FOR EACH ROW
BEGIN
    IF NEW.SALARY > OLD.SALARY THEN
        INSERT INTO SALARY_HISTORY (EMPLOYEE_ID, OLD_SALARY, NEW_SALARY, CHANGE_DATE)
        VALUES (NEW.EMPLOYEE_ID, OLD.SALARY, NEW.SALARY, NOW());
    END IF;
END;
--En este ejemplo, se crea un trigger llamado update_salary que se activa después de que se actualiza una fila en la tabla EMPLOYEES. Cuando el salario de un empleado se actualiza a un valor mayor que el salario anterior, este trigger registra la información relevante en una tabla llamada SALARY_HISTORY.
--Ambos CREATE INDEX y TRIGGER son herramientas poderosas en SQL que permiten mejorar el rendimiento y la funcionalidad de una base de datos, respectivamente.

-- VISTAS TEMPORALES EN SQL

/*
Las vistas temporales son vistas que solo existen durante la duración de una sesión de base de datos.
Una vez que la sesión se cierra, la vista temporal se elimina automáticamente.
Son útiles para consultas complejas que requieren resultados intermedios sin crear una tabla permanente.
*/

-- Ejemplo de creación de una vista temporal
CREATE TEMPORARY VIEW recent_orders AS
SELECT *
FROM ORDERS
WHERE order_date >= DATE('now', '-1 month');

-- Esta vista temporal 'recent_orders' muestra todos los pedidos realizados en el último mes.
-- Desaparecerá automáticamente cuando la sesión de la base de datos termine.

-- VISTAS MATERIALIZADAS EN SQL

/*
Las vistas materializadas son similares a las vistas regulares, pero con una diferencia clave: 
almacenan físicamente los resultados de la consulta en la base de datos. 
Esto permite un acceso rápido a los datos, ya que no es necesario ejecutar la consulta base cada vez.
Son útiles para optimizar el rendimiento en consultas complejas o en conjuntos de datos grandes.
*/

-- Ejemplo de creación de una vista materializada
CREATE MATERIALIZED VIEW sales_summary AS
SELECT product_id, SUM(sales_amount) AS total_sales
FROM SALES
GROUP BY product_id;

-- Esta vista materializada 'sales_summary' almacena el total de ventas por producto.
-- A diferencia de una vista normal, 'sales_summary' almacena los datos resultantes en la base de datos,
-- permitiendo un acceso más rápido a los datos.
-- ACTUALIZACIÓN DE UNA VISTA MATERIALIZADA
/*
Una vista materializada necesita ser actualizada manualmente si los datos subyacentes cambian.
Esto se puede hacer usando el comando REFRESH MATERIALIZED VIEW.
*/
-- Actualizar la vista materializada 'sales_summary'
REFRESH MATERIALIZED VIEW sales_summary;
-- La vista materializada 'sales_summary' ahora refleja los datos más recientes de la tabla SALES.

-- CTEs (Common Table Expressions) en SQL
-- Una CTE (Common Table Expression) es una expresión de tabla común que proporciona un nombre temporal a un conjunto de resultados.
-- Esto permite dividir consultas complejas en partes más manejables y hace que el código sea más legible.
-- Las CTEs sólo existen durante la ejecución de la consulta en la que se definen y desaparecen después de que la consulta se ejecuta.
-- Sintaxis básica de una CTE:
-- WITH CTE_name AS (
--     -- Aquí va la subconsulta o la expresión de la tabla común
--     SELECT column1, column2, ...
--     FROM table_name
--     WHERE condition
-- )
-- -- Consulta principal que utiliza la CTE
-- SELECT column1, column2, ...
-- FROM CTE_name
-- WHERE condition;
-- Ejemplo de uso de una CTE:
WITH OrderCount AS (
    -- Definimos la CTE llamada OrderCount
    -- Calcula el número total de pedidos por cada cliente
    SELECT customer_id, COUNT(order_id) AS num_orders
    FROM ORDERS
    GROUP BY customer_id
)
-- Utilizamos la CTE OrderCount en la consulta principal
SELECT customer_id
FROM OrderCount
WHERE num_orders > 5;
-- En este ejemplo:
-- 1. La CTE 'OrderCount' se define primero, calculando el número de pedidos por cliente.
-- 2. La consulta principal selecciona sólo aquellos clientes ('customer_id') que tienen más de 5 pedidos ('num_orders > 5').
--Otro ejemplo:
WITH AverageSalaries AS(
    SELECT d.DepartmentName, AVG(e.Salary) AS AvgSalary
    FROM Employees e
    JOIN Departments d ON e.DepartmentID = d.DepartmentID
    GROUP BY d.DepartmentNanme
)
SELECT DepartmentName, AvgSalary
FROM AverageSalaries
WHERE AvgSalary > 65000

