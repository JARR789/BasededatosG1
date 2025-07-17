USE tareas;
# Creación de la tabla Sucursal
CREATE TABLE Sucursal (
    NumSucursal INT NOT NULL AUTO_INCREMENT,
    NombreSucursal VARCHAR(50) NOT NULL,
    Ubicacion VARCHAR(100) NOT NULL,
    CONSTRAINT pk_Sucursal
    PRIMARY KEY (NumSucursal)
    
);

# Creación de la tabla Vehiculo
CREATE TABLE Vehiculo (
    NumVehiculo INT NOT NULL AUTO_INCREMENT,
    Modelo VARCHAR(50) NOT NULL,
    Placa VARCHAR(20) NOT NULL UNIQUE,
    Anio INT NOT NULL,
    Marca VARCHAR(30) NOT NULL,
    NumSucursal INT NOT NULL,
    CONSTRAINT pk_Vehiculo
    PRIMARY KEY (NumVehiculo),
    CONSTRAINT fk_Vehiculo_Sucursal
    FOREIGN KEY (NumSucursal)
    REFERENCES Sucursal(NumSucursal)
    
);

# Creación de la tabla Clientes
CREATE TABLE Clientes (
    NumCliente INT NOT NULL AUTO_INCREMENT,
    CURP VARCHAR(18) NOT NULL UNIQUE,
    ApellidoPaterno VARCHAR(50) NOT NULL,
    ApellidoMaterno VARCHAR(50) NOT NULL,
    NombrePila VARCHAR(30) NOT NULL,
    Telefono INT NOT NULL,
    Calle VARCHAR(50) NOT NULL,
    NumeroCalle INT NOT NULL,
    Ciudad VARCHAR(30) NOT NULL,
    CONSTRAINT pk_Clientes
    PRIMARY KEY (NumCliente)
    
);

# Creación de la tabla Renta
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