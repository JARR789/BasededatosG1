USE tareas;
# Creación de la tabla Paciente
CREATE TABLE Paciente (
    NumPaciente INT NOT NULL AUTO_INCREMENT,
    NombrePila VARCHAR(30) NOT NULL,
    ApellidoPaterno VARCHAR(50) NOT NULL,
    ApellidoMaterno VARCHAR(50) NULL,
    CONSTRAINT pk_Paciente
    PRIMARY KEY (NumPaciente)
    
);

# Creación de la tabla Doctores
CREATE TABLE Doctores (
    NumDoctor INT NOT NULL AUTO_INCREMENT,
    NombrePila VARCHAR(30) NOT NULL,
    ApellidoPaterno VARCHAR(50) NOT NULL,
    ApellidoMaterno VARCHAR(50) NULL,
    CONSTRAINT pk_Doctores
    PRIMARY KEY (NumDoctor)
    
);

# Creación de la tabla Consulta (con PK compuesta)
CREATE TABLE Consulta (
    NumPaciente INT NOT NULL,
    NumDoctor INT NOT NULL,
    FechaConsulta DATE NOT NULL,
    Atencion VARCHAR(100) NOT NULL,
    CONSTRAINT pk_Consulta
    PRIMARY KEY (NumPaciente, NumDoctor),
    CONSTRAINT fk_Consulta_Paciente
    FOREIGN KEY (NumPaciente)
    REFERENCES Paciente(NumPaciente),
    CONSTRAINT fk_Consulta_Doctores
    FOREIGN KEY (NumDoctor)
    REFERENCES Doctores(NumDoctor)
    
);