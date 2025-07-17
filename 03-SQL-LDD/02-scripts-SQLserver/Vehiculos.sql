USE tareas;
go
-- Creación de la tabla Sucursal
CREATE TABLE Sucursal (
    NumSucursal INT NOT NULL IDENTITY(1,1),
    NombreSucursal NVARCHAR(50) NOT NULL,
    Ubicacion NVARCHAR(100) NOT NULL,
    CONSTRAINT pk_Sucursal 
	PRIMARY KEY (NumSucursal)
);
GO

-- Creación de la tabla Vehiculo
CREATE TABLE Vehiculo (
    NumVehiculo INT NOT NULL IDENTITY(1,1),
    Modelo NVARCHAR(50) NOT NULL,
    Placa NVARCHAR(20) NOT NULL UNIQUE,
    Anio INT NOT NULL,
    Marca NVARCHAR(30) NOT NULL,
    NumSucursal INT NOT NULL,
    CONSTRAINT pk_Vehiculo 
	PRIMARY KEY (NumVehiculo),
    CONSTRAINT fk_Vehiculo_Sucursal 
	FOREIGN KEY (NumSucursal) 
    REFERENCES Sucursal(NumSucursal)
);
GO

-- Creación de la tabla Clientes
CREATE TABLE Clientes (
    NumCliente INT NOT NULL IDENTITY(1,1),
    CURP NVARCHAR(18) NOT NULL UNIQUE,
    ApellidoPaterno NVARCHAR(50) NOT NULL,
    ApellidoMaterno NVARCHAR(50) NOT NULL,
    NombrePila NVARCHAR(30) NOT NULL,
    Telefono INT NOT NULL,
    Calle NVARCHAR(50) NOT NULL,
    NumeroCalle INT NOT NULL,
    Ciudad NVARCHAR(30) NOT NULL,
    CONSTRAINT pk_Clientes 
	PRIMARY KEY (NumCliente)
);
GO

-- Creación de la tabla Renta 
CREATE TABLE Renta (
    NumCliente INT NOT NULL,
    NumVehiculo INT NOT NULL,
    FechaInicio DATE NOT NULL,
    FechaFinal DATE NOT NULL,
    CONSTRAINT pk_Renta 
	PRIMARY KEY (NumCliente, NumVehiculo),
    CONSTRAINT fk_Renta_Clientes 
	FOREIGN KEY (NumCliente) 
    REFERENCES Clientes(NumCliente),
    CONSTRAINT fk_Renta_Vehiculo 
	FOREIGN KEY (NumVehiculo) 
    REFERENCES Vehiculo(NumVehiculo)
);
GO