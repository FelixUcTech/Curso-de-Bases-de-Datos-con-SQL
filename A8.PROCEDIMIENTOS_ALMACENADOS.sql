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

--Opción con EXEC


