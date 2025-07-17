USE tareas;
go

--Crear tabla estudiante
CREATE TABLE estudiante(
EstudianteId int not null identity(1,1),
NombreEstudiante nvarchar(30) not null,
ApellidoPaterno nvarchar(50) not null,
ApellidoMaterno nvarchar (50) null,
Matricula nvarchar(18) not null,
CONSTRAINT pk_estudiante
PRIMARY KEY (EstudianteId),
CONSTRAINT unique_matricula
UNIQUE(Matricula),

);
 GO	

 --Crear la tabla curso
 CREATE TABLE curso(
 CursoId int not null identity(1,1),
 nombreCurso nvarchar(50) not null,
 codigoCurso nvarchar(18) not null,
 CONSTRAINT pk_curso
 PRIMARY KEY (CursoId),
 CONSTRAINT unique_codigoCurso
 UNIQUE(codigoCurso),
 );
 GO

 --Crear la tabla Inscripcion
 CREATE TABLE inscripcion(
 EstudianteId INT NOT NULL,
 CursoId INT NOT NULL,
 FechaInscripcion DATE NOT NULL,
 CONSTRAINT pk_Inscripcion 
 PRIMARY KEY (EstudianteId, CursoId), -- PK compuesta
 CONSTRAINT fk_Inscripcion_Estudiante
 FOREIGN KEY (EstudianteId) 
 REFERENCES estudiante(EstudianteId),
 CONSTRAINT fk_Inscripcion_Curso
 FOREIGN KEY (CursoId) 
 REFERENCES curso(CursoId)
 );
 GO

