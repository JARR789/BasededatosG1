USE tareas;
# Creación de la tabla Department
CREATE TABLE Department (
    DepartmentId INT NOT NULL AUTO_INCREMENT,
    NameDepartment VARCHAR(50) NOT NULL,
    NumberPrudent INT NOT NULL,
    StartDate DATE NOT NULL,
    Manager VARCHAR(20) NOT NULL,
    CONSTRAINT pk_Department
    PRIMARY KEY (DepartmentId)
    
);

# Creación de la tabla Employee
CREATE TABLE Employee (
    EmployeeId INT NOT NULL AUTO_INCREMENT,
    SSN VARCHAR(20) NOT NULL UNIQUE,
    LastName VARCHAR(50) NOT NULL,
    FirstName VARCHAR(30) NOT NULL,
    Salary DECIMAL(10,2) NOT NULL,
    Birthday DATE NOT NULL,
    Address  VARCHAR(50) NULL,
    Gender VARCHAR(30) NOT NULL,
    DepartmentId INT NOT NULL,
    Boss INT NULL,
    CONSTRAINT pk_Employee
    PRIMARY KEY (EmployeeId),
    CONSTRAINT fk_Employee_Department
    FOREIGN KEY (DepartmentId)
    REFERENCES Department(DepartmentId),
    CONSTRAINT fk_Employee_Boss FOREIGN KEY (Boss)
    REFERENCES Employee(EmployeeId)
    
);

# Creación de la tabla Project
CREATE TABLE Project (
    ProjectId INT NOT NULL AUTO_INCREMENT,
    NumberProject INT NOT NULL UNIQUE,
    NameProject VARCHAR(50) NOT NULL,
    Location VARCHAR(50) NOT NULL,
    DepartmentId INT NOT NULL,
    CONSTRAINT pk_Project
    PRIMARY KEY (ProjectId),
    CONSTRAINT fk_Project_Department
    FOREIGN KEY (DepartmentId)
    REFERENCES Department(DepartmentId)
    
);

# Creación de la tabla Dependent
CREATE TABLE Dependent (
    EmployeeId INT NOT NULL,
    NameDependent VARCHAR(50) NOT NULL,
    Gender VARCHAR(30) NOT NULL,
    Relationship VARCHAR(50) NOT NULL,
    CONSTRAINT pk_Dependent
    PRIMARY KEY (EmployeeId, NameDependent),
    CONSTRAINT fk_Dependent_Employee
    FOREIGN KEY (EmployeeId)
    REFERENCES Employee(EmployeeId) ON DELETE CASCADE
    
);

# Creación de la tabla WorkOn (con PK compuesta)
CREATE TABLE WorkOn (
    EmployeeId INT NOT NULL,
    ProjectId INT NOT NULL,
    Hours INT NOT NULL DEFAULT 0,
    CONSTRAINT pk_WorkOn
    PRIMARY KEY (EmployeeId, ProjectId),
    CONSTRAINT fk_WorkOn_Employee
    FOREIGN KEY (EmployeeId)
    REFERENCES Employee(EmployeeId),
    CONSTRAINT fk_WorkOn_Project
    FOREIGN KEY (ProjectId)
    REFERENCES Project(ProjectId)
    
);