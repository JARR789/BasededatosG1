--Construccion de diagramas
--Crear la BD
CREATE DATABASE tareas;
go
USE tareas;
go
-- Creación de la tabla Categoria
CREATE TABLE Categoria (
    CategoriaId INT NOT NULL IDENTITY(1,1),
    NombreCategoria NVARCHAR(50) NOT NULL,
    CONSTRAINT pk_Categoria PRIMARY KEY (CategoriaId)
);
GO

-- Creación de la tabla Productos
CREATE TABLE Productos (
    ProductoId INT NOT NULL IDENTITY(1,1),
    NombreProducto NVARCHAR(100) NOT NULL,
    Existencia INT NOT NULL,
    PrecioUnitario DECIMAL(10,2) NOT NULL,
    CategoriaId INT NOT NULL,
    CONSTRAINT pk_Productos PRIMARY KEY (ProductoId),
    CONSTRAINT fk_Productos_Categoriat FOREIGN KEY (CategoriaId) 
        REFERENCES Categoria(CategoriaId)
);
GO

-- Creación de la tabla Cliente
CREATE TABLE Cliente (
    IdCliente INT NOT NULL IDENTITY(1,1),
    NombreCliente NVARCHAR(100) NOT NULL,
    RFC NVARCHAR(20) NOT NULL,
    Direccion NVARCHAR(200) NOT NULL,
    CONSTRAINT pk_Cliente PRIMARY KEY (IdCliente)
);
GO

-- Creación de la tabla Pedido
CREATE TABLE Pedido (
    PedidoId INT NOT NULL IDENTITY(1,1),
    Fecha DATETIME NOT NULL DEFAULT GETDATE(),
    IdCliente INT NOT NULL,
    CONSTRAINT pk_Pedidot PRIMARY KEY (PedidoId),
    CONSTRAINT fk_Pedido_Clientet FOREIGN KEY (IdCliente) 
        REFERENCES Cliente(IdCliente)
);
GO

-- Creación de la tabla DetallePedido
CREATE TABLE DetallePedido (
    PedidoId INT NOT NULL,
    ProductoId INT NOT NULL,
    PrecioVenta DECIMAL(10,2) NOT NULL,
    CantidadVendida INT NOT NULL,
    CONSTRAINT pk_DetallePedido PRIMARY KEY (PedidoId, ProductoId),
    CONSTRAINT fk_DetallePedido_Pedidot FOREIGN KEY (PedidoId) 
        REFERENCES Pedido(PedidoId),
    CONSTRAINT fk_DetallePedido_Productos FOREIGN KEY (ProductoId) 
        REFERENCES Productos(ProductoId)
);
GO