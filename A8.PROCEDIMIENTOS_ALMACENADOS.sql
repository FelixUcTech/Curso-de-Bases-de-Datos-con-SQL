--Sintaxis del procedimiento
CREATE PROCEDURE IngresoEmpleado
  @FirstName NVARCHAR(50),
  @LastName NVARCHAR(50),
  @DepartmentID INT,
  @Salary Decimal(10,2),
  @HireDate DATE
AS
BEGIN 
      INSERT INTO Empreados(FirstName, LastName, DepartmentID, Salary, HireDate)
      VALUES (@FirstName, @LastName, DepartmentID, Salary, HireDate);
END;
--Como se ejecuta la informaicón?, dependiendo el leguaje qué estemos utilizando
--Opciión con CALL
CALL IngresoEmpleado('Félix', 'Uc', 27, 80000, '04-09-2024');
--Opción con EXEC
EXEC IngresoEmpleado('Félix', 'Uc', 27, 80000, '04-09-2024');

