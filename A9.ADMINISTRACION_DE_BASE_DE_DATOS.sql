-- Existen escenarios críticos en los que se pueden cometer errores catastróficos, 
-- como ejecutar un DROP TABLE sin intención o realizar un DELETE sin una cláusula WHERE.
-- Estos errores pueden eliminar completamente datos de una tabla o eliminar todas las filas accidentalmente.

-- ¿Qué ocurre si el servidor de la base de datos se cae durante un período prolongado?
-- Es fundamental tener planes y procesos para recuperar la base de datos y minimizar el tiempo de inactividad.

-- Conceptos clave para la recuperación y continuidad de las bases de datos:
    -- **Backups (Respaldo)**: Realizar copias de seguridad periódicas es crucial para asegurar que los datos puedan recuperarse en caso de pérdida o corrupción.
    -- **Restauración de bases de datos**: Es el proceso de recuperar una base de datos desde un backup para devolverla a un estado operativo después de una falla o desastre.

-- Para gestionar estos aspectos críticos, existe un rol especializado: el Administrador de Bases de Datos (DBA, por sus siglas en inglés).

-- Las responsabilidades del Administrador de Bases de Datos incluyen:
    -- **Disponibilidad de la base de datos**: Asegurar que la base de datos esté siempre operativa y accesible para los usuarios y aplicaciones.
    -- **Seguridad de la base de datos**: Proteger los datos frente a accesos no autorizados, asegurando que las políticas de seguridad estén correctamente implementadas.


--¿Cómo hacemos una importación y una exportación?
--Con esta herramienta se hace un ejericicio, mediante el entorno gráfico del software, MySQL Workbench:
--en 99.CONSEJOS AYUDA, SE PRESENTA UN POCO MÁS DE INFORMACIÓN REFERENTE A ESTE SOFTWARE


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- GRANT:
-- El comando `GRANT` se utiliza para otorgar permisos específicos a los usuarios o roles en una base de datos.
-- Estos permisos determinan qué operaciones puede realizar un usuario en los objetos de la base de datos, 
-- como tablas, vistas, procedimientos almacenados, entre otros.

-- Sintaxis general de GRANT:
-- GRANT permiso ON objeto TO usuario;

-- Donde:
-- 1. `permiso` es el tipo de permiso que se otorga (SELECT, INSERT, UPDATE, DELETE, etc.).
-- 2. `objeto` es el objeto de la base de datos al que se aplica el permiso (tabla, vista, procedimiento, etc.).
-- 3. `usuario` es el nombre del usuario o rol al que se le otorgan los permisos.

-- Ejemplo 1: Otorgar permiso SELECT en la tabla `employees` al usuario `user1`
GRANT SELECT ON employees TO 'user1';

-- Ejemplo 2: Otorgar permisos SELECT y INSERT en la tabla `employees` al usuario `user2`
GRANT SELECT, INSERT ON employees TO 'user2';

-- Ejemplo 3: Otorgar permisos para ejecutar un procedimiento almacenado llamado `InsertEmployee` al usuario `user3`
GRANT EXECUTE ON PROCEDURE InsertEmployee TO 'user3';

-- Ejemplo 4: Otorgar todos los permisos en la base de datos `company` a un usuario administrador llamado `admin_user`
GRANT ALL PRIVILEGES ON company.* TO 'admin_user';

-- NOTA: El uso de `ALL PRIVILEGES` otorga todos los permisos posibles a nivel de la base de datos.

--------------------------------------------------

-- REVOKE:
-- El comando `REVOKE` se utiliza para eliminar o revocar permisos previamente otorgados a un usuario o rol en una base de datos.

-- Sintaxis general de REVOKE:
-- REVOKE permiso ON objeto FROM usuario;

-- Donde:
-- 1. `permiso` es el tipo de permiso que se revoca (SELECT, INSERT, UPDATE, DELETE, etc.).
-- 2. `objeto` es el objeto de la base de datos del que se revocan los permisos (tabla, vista, procedimiento, etc.).
-- 3. `usuario` es el nombre del usuario o rol al que se le revocan los permisos.

-- Ejemplo 1: Revocar permiso SELECT en la tabla `employees` del usuario `user1`
REVOKE SELECT ON employees FROM 'user1';

-- Ejemplo 2: Revocar permisos SELECT y INSERT en la tabla `employees` del usuario `user2`
REVOKE SELECT, INSERT ON employees FROM 'user2';

-- Ejemplo 3: Revocar permiso de ejecución en el procedimiento `InsertEmployee` del usuario `user3`
REVOKE EXECUTE ON PROCEDURE InsertEmployee FROM 'user3';

-- Ejemplo 4: Revocar todos los permisos en la base de datos `company` del usuario `admin_user`
REVOKE ALL PRIVILEGES ON company.* FROM 'admin_user';

--------------------------------------------------

-- IMPORTANTE:
-- 1. Cuando se utilizan los comandos `GRANT` y `REVOKE`, es esencial tener cuidado al asignar o eliminar permisos,
--    ya que los permisos definen qué acciones pueden realizar los usuarios en los objetos de la base de datos.
-- 2. Solo los usuarios con los permisos adecuados (por ejemplo, un DBA o administrador) pueden ejecutar estos comandos.
-- 3. Para que estos cambios sean efectivos, asegúrate de tener acceso suficiente a la base de datos como administrador o superusuario.

