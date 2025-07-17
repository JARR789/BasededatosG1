CREATE DATABASE examenes;
go
USE examenes;
-- Creación de la tabla Instructor
CREATE TABLE Instructor (
    SSN INT NOT NULL,
    FName NVARCHAR(30) NOT NULL,
    LName NVARCHAR(50) NOT NULL,
    CONSTRAINT pk_Instructor 
	PRIMARY KEY (SSN)
);
GO

-- Creación de la tabla Class 
CREATE TABLE Class (
    CourseNum INT NOT NULL,
    Year DATE NOT NULL,
    Term NVARCHAR(50) NOT NULL,
    Section NVARCHAR(50) NOT NULL,
    CONSTRAINT pk_Class 
	PRIMARY KEY (CourseNum, Year, Term, Section)
);
GO

-- Creación de la tabla Teaches 
CREATE TABLE Teaches (
    SSN INT NOT NULL,
    CourseNum INT NOT NULL,
    Year DATE NOT NULL,
    Term NVARCHAR(50) NOT NULL,
    Section NVARCHAR(50) NOT NULL,
    CONSTRAINT pk_Teaches 
	PRIMARY KEY (SSN, CourseNum, Year, Term, Section),
    CONSTRAINT fk_Teaches_Instructor 
	FOREIGN KEY (SSN) 
    REFERENCES Instructor(SSN),
    CONSTRAINT fk_Teaches_Class 
	FOREIGN KEY (CourseNum, Year, Term, Section) 
    REFERENCES Class(CourseNum, Year, Term, Section)
);
GO