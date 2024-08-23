-- Creación de la tabla STUDENTS (Estudiantes)
CREATE TABLE STUDENTS(
    STUDENTID INT PRIMARY KEY,  -- Identificador único del estudiante (clave primaria)
    FIRSTNAME VARCHAR(50),      -- Primer nombre del estudiante
    LASTNAME VARCHAR(50),       -- Apellido del estudiante
    AGE SMALLINT,               -- Edad del estudiante
    EMAIL VARCHAR(100),         -- Correo electrónico del estudiante
    LOADDATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- Fecha y hora de carga, con valor por defecto actual
    UPDATEDATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP  -- Fecha y hora de actualización, con valor por defecto actual
);

-- Creación de la tabla TEACHER (Profesores)
CREATE TABLE TEACHER(
    TEACHERID INT PRIMARY KEY,  -- Identificador único del profesor (clave primaria)
    FIRSTNAME VARCHAR,          -- Primer nombre del profesor
    LASTNAME VARCHAR,           -- Apellido del profesor
    AGE SMALLINT,               -- Edad del profesor
    EMAIL VARCHAR(100),         -- Correo electrónico del profesor
    PHONE VARCHAR(20),          -- Número de teléfono del profesor
    DIRECCION VARCHAR(20),      -- Dirección del profesor (se sugiere aumentar la longitud)
    HIRE_DATE DATE,             -- Fecha de contratación del profesor
    SALARY DECIMAL(10,2)        -- Salario del profesor en formato decimal
);

-- Creación de la tabla COURSES (Cursos)
CREATE TABLE COURSES(
    COURSESID INT PRIMARY KEY,         -- Identificador único del curso (clave primaria)
    COURSESNAME VARCHAR(100),          -- Nombre del curso
    DESCRIPCION TEXT,                  -- Descripción del curso (texto largo)
    TEACHERID INT,                     -- Identificador del profesor que imparte el curso (clave foránea)
    DURATIONMINUTS SMALLINT,           -- Duración del curso en minutos
    LOADDATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- Fecha y hora de carga, con valor por defecto actual
    FOREIGN KEY (TEACHERID) REFERENCES TEACHER (TEACHERID)  -- Clave foránea que referencia a TEACHERID en la tabla TEACHER
);

-- Creamos una tabla llamada STUDENT_COURSE para manejar qué estudiantes están inscritos en qué cursos.
CREATE TABLE STUDENT_COURSE (
    STUDENTID INT,  -- Aquí almacenamos el identificador único del estudiante.
    COURSESID INT,  -- Aquí almacenamos el identificador único del curso.
    ENROLLMENT_DATE DATE,  -- La fecha en que el estudiante se inscribió en el curso.
    PRIMARY KEY (STUDENTID, COURSESID),  -- Esta combinación única asegura que cada estudiante no se inscribe dos veces en el mismo curso.
    FOREIGN KEY (STUDENTID) REFERENCES STUDENTS(STUDENTID),  -- Nos aseguramos de que el STUDENTID que almacenamos aquí corresponda a un estudiante existente en la tabla STUDENTS.
    FOREIGN KEY (COURSESID) REFERENCES COURSES(COURSESID)  -- Y aquí, que el COURSESID corresponda a un curso existente en la tabla COURSES.
);   