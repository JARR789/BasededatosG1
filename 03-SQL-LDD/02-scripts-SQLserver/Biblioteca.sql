USE tareas;
go
-- Creación de la tabla Lector
CREATE TABLE Lector (
    NumLector INT NOT NULL IDENTITY(1,1),
    NumMembresia INT NOT NULL,
    NombreLector NVARCHAR(50) NOT NULL,
    ApellidoPaterno NVARCHAR(50) NOT NULL,
    ApellidoMaterno NVARCHAR(50) NULL,
    CONSTRAINT pk_Lector PRIMARY KEY (NumLector)
);
GO

-- Creación de la tabla Libro
CREATE TABLE Libro (
    NumLibro INT NOT NULL IDENTITY(1,1),
    Titulo NVARCHAR(100) NOT NULL,
    Autor NVARCHAR(200) NOT NULL,
    ISBN NVARCHAR(50) NOT NULL,
    Cantidad INT NOT NULL,
    CONSTRAINT pk_Libro PRIMARY KEY (NumLibro)
);
GO

-- Creación de la tabla Presta
CREATE TABLE Presta (
    NumLibro INT NOT NULL,
    NumLector INT NOT NULL,
    CONSTRAINT pk_Presta
	PRIMARY KEY (NumLibro, NumLector),
    CONSTRAINT fk_Presta_Libro
	FOREIGN KEY (NumLibro) 
        REFERENCES Libro(NumLibro),
    CONSTRAINT fk_Presta_Lector
	FOREIGN KEY (NumLector) 
        REFERENCES Lector(NumLector)
);
GO