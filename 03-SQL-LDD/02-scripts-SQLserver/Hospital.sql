USE tareas;
go
-- Creación de la tabla Paciente
CREATE TABLE Paciente (
    NumPaciente INT NOT NULL IDENTITY(1,1),
    NombrePila NVARCHAR(30) NOT NULL,
    ApellidoPaterno NVARCHAR(50) NOT NULL,
    ApellidoMaterno NVARCHAR(50) NULL,
    CONSTRAINT pk_Paciente 
	PRIMARY KEY (NumPaciente)
);
GO

-- Creación de la tabla Doctores
CREATE TABLE Doctores (
    NumDoctor INT NOT NULL IDENTITY(1,1),
    NombrePila NVARCHAR(30) NOT NULL,
    ApellidoPaterno NVARCHAR(50) NOT NULL,
    ApellidoMaterno NVARCHAR(50) NULL,
    CONSTRAINT pk_Doctores 
	PRIMARY KEY (NumDoctor)
);
GO

-- Creación de la tabla Consulta (con PK compuesta)
CREATE TABLE Consulta (
    NumPaciente INT NOT NULL,
    NumDoctor INT NOT NULL,
    FechaConsulta DATE NOT NULL,
    Atencion NVARCHAR(100) NOT NULL,
    CONSTRAINT pk_Consulta 
	PRIMARY KEY (NumPaciente, NumDoctor),
    CONSTRAINT fk_Consulta_Paciente 
	FOREIGN KEY (NumPaciente) 
    REFERENCES Paciente(NumPaciente),
    CONSTRAINT fk_Consulta_Doctores 
	FOREIGN KEY (NumDoctor) 
    REFERENCES Doctores(NumDoctor)
);
GO