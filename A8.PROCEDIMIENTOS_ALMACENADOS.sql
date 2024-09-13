-- Procedimiento almacenado en SQL Server
-- En SQL Server, se utiliza `AS` antes del bloque `BEGIN...END` y los parámetros se declaran con `@`.
-- Este procedimiento inserta un nuevo empleado en la tabla `Empleados`.

CREATE PROCEDURE IngresoEmpleado
  @FirstName NVARCHAR(50),  -- Parámetro de entrada para el nombre del empleado
  @LastName NVARCHAR(50),   -- Parámetro de entrada para el apellido del empleado
  @DepartmentID INT,        -- Parámetro de entrada para el ID del departamento
  @Salary Decimal(10,2),    -- Parámetro de entrada para el salario del empleado
  @HireDate DATE            -- Parámetro de entrada para la fecha de contratación
AS
BEGIN 
    -- Inserta los valores proporcionados en la tabla Empleados
    INSERT INTO Empleados(FirstName, LastName, DepartmentID, Salary, HireDate)
    VALUES (@FirstName, @LastName, @DepartmentID, @Salary, @HireDate);
END;

-- Para ejecutar este procedimiento en SQL Server, puedes usar `EXEC`:
-- Esto insertará un nuevo empleado en la tabla.
EXEC IngresoEmpleado 'Félix', 'Uc', 27, 80000, '2024-09-04';

-- Procedimiento almacenado en MySQL
-- En MySQL, no se usa `AS` y los parámetros se declaran con `IN`, `OUT` o `INOUT`.
-- Este procedimiento inserta un nuevo empleado en la tabla `Empleados`.

CREATE PROCEDURE IngresoEmpleado
  IN FirstName NVARCHAR(50),  -- Parámetro de entrada para el nombre del empleado
  IN LastName NVARCHAR(50),   -- Parámetro de entrada para el apellido del empleado
  IN DepartmentID INT,        -- Parámetro de entrada para el ID del departamento
  IN Salary Decimal(10,2),    -- Parámetro de entrada para el salario del empleado
  IN HireDate DATE            -- Parámetro de entrada para la fecha de contratación
BEGIN 
    -- Inserta los valores proporcionados en la tabla Empleados
    -- Nota: No se usa `@` para los parámetros en MySQL.
    INSERT INTO Empleados(FirstName, LastName, DepartmentID, Salary, HireDate)
    VALUES (FirstName, LastName, DepartmentID, Salary, HireDate);
END;

-- Para ejecutar este procedimiento en MySQL, debes usar `CALL`:
-- Esto insertará un nuevo empleado en la tabla.
CALL IngresoEmpleado('Félix', 'Uc', 27, 80000, '2024-09-04');





-- Cambiar el delimitador temporalmente para evitar problemas con el `;` dentro del procedimiento
DELIMITER //

-- Procedimiento almacenado en MySQL para insertar un empleado y actualizar el promedio de salarios
CREATE PROCEDURE IngresoEmpleadoActualizarPromedioSalario
  -- Parámetros de entrada
  IN FirstName NVARCHAR(50),  
  IN LastName NVARCHAR(50),   
  IN DepartmentID INT,        
  IN Salary Decimal(10,2),    
  IN HireDate DATE,           
  -- Parámetro de salida para el promedio de salario
  OUT PromedioSalario DECIMAL(10,2)  
BEGIN
    -- Declarar una variable local para almacenar el promedio temporalmente
    DECLARE ProSalario DECIMAL(10,2);
    
    -- Manejador de errores: Si ocurre una excepción, deshacer los cambios
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
      -- Mostrar un mensaje de error al usuario
      SELECT 'Error: No se pudo completar la operación.' AS ErrorMensaje;
      -- Deshacer la transacción si ocurre un error
      ROLLBACK;
    END;

    -- Iniciar la transacción
    START TRANSACTION;

    -- Insertar el nuevo empleado en la tabla Empleados
    INSERT INTO Empleados(FirstName, LastName, DepartmentID, Salary, HireDate)
    VALUES (FirstName, LastName, DepartmentID, Salary, HireDate);

    -- Calcular el nuevo promedio de salario para el departamento del empleado recién insertado
    SELECT AVG(Salary)
    INTO ProSalario
    FROM Empleados
    WHERE DepartmentID = IngresoEmpleadoActualizarPromedioSalario.DepartmentID;

    -- Asignar el promedio de salario calculado al parámetro de salida
    SET PromedioSalario = ProSalario;

    -- Confirmar la transacción si no hubo errores
    COMMIT;
END //

-- Restaurar el delimitador predeterminado
DELIMITER ;

-- Para ejecutar este procedimiento en MySQL, debes usar `CALL`:
-- Esto insertará un nuevo empleado en la tabla.
CALL IngresoEmpleadoActualizarPromedioSalario('Félix', 'Uc', 27, 80000, '2024-09-04');
