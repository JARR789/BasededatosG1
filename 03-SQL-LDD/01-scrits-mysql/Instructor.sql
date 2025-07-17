CREATE DATABASE examenes;
USE examenes;
# Creación de la tabla Instructor
CREATE TABLE Instructor (
    SSN INT NOT NULL,
    FName VARCHAR(30) NOT NULL,
    LName VARCHAR(50) NOT NULL,
    CONSTRAINT pk_Instructor
    PRIMARY KEY (SSN)
    
);

# Creación de la tabla Class
CREATE TABLE Class (
    CourseNum INT NOT NULL,
    Year DATE NOT NULL,
    Term VARCHAR(50) NOT NULL,
    Section VARCHAR(50) NOT NULL,
    CONSTRAINT pk_Class
    PRIMARY KEY (CourseNum, Year, Term, Section)
    
);

# Creación de la tabla Teaches
CREATE TABLE Teaches (
    SSN INT NOT NULL,
    CourseNum INT NOT NULL,
    Year DATE NOT NULL,
    Term VARCHAR(50) NOT NULL,
    Section VARCHAR(50) NOT NULL,
    CONSTRAINT pk_Teaches
    PRIMARY KEY (SSN, CourseNum, Year, Term, Section),
    CONSTRAINT fk_Teaches_Instructor
    FOREIGN KEY (SSN)
    REFERENCES Instructor(SSN),
    CONSTRAINT fk_Teaches_Class
    FOREIGN KEY (CourseNum, Year, Term, Section)
    REFERENCES Class(CourseNum, Year, Term, Section)
    
);