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



