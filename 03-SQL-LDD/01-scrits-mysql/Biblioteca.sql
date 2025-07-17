CREATE DATABASE tareas;
USE tareas;
# Creación de la tabla Lector
CREATE TABLE Lector (
    NumLector INT NOT NULL AUTO_INCREMENT,
    NumMembresia INT NOT NULL,
    NombreLector VARCHAR(50) NOT NULL,
    ApellidoPaterno VARCHAR(50) NOT NULL,
    ApellidoMaterno VARCHAR(50) NULL,
    CONSTRAINT pk_Lector PRIMARY KEY (NumLector)
    
);

# Creación de la tabla Libro
CREATE TABLE Libro (
    NumLibro INT NOT NULL AUTO_INCREMENT,
    Titulo VARCHAR(100) NOT NULL,
    Autor VARCHAR(200) NOT NULL,
    ISBN VARCHAR(50) NOT NULL,
    Cantidad INT NOT NULL,
    CONSTRAINT pk_Libro PRIMARY KEY (NumLibro)
    
);

# Creación de la tabla Presta
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