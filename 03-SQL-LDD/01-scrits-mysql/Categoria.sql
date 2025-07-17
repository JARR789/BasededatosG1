# Construccion de diagramas
# Crear la BD
CREATE DATABASE tareas;
USE tareas;
# Creación de la tabla Categoria
CREATE TABLE Categoria (
    CategoriaId INT NOT NULL AUTO_INCREMENT,
    NombreCategoria VARCHAR(50) NOT NULL,
    CONSTRAINT pk_Categoria PRIMARY KEY (CategoriaId)
    
);

# Creación de la tabla Productos
CREATE TABLE Productos (
    ProductoId INT NOT NULL AUTO_INCREMENT,
    NombreProducto VARCHAR(100) NOT NULL,
    Existencia INT NOT NULL,
    PrecioUnitario DECIMAL(10,2) NOT NULL,
    CategoriaId INT NOT NULL,
    CONSTRAINT pk_Productos PRIMARY KEY (ProductoId),
    CONSTRAINT fk_Productos_Categoriat FOREIGN KEY (CategoriaId)
    REFERENCES Categoria(CategoriaId)
    
);

# Creación de la tabla Cliente
CREATE TABLE Cliente (
    IdCliente INT NOT NULL AUTO_INCREMENT,
    NombreCliente VARCHAR(100) NOT NULL,
    RFC VARCHAR(20) NOT NULL,
    Direccion VARCHAR(200) NOT NULL,
    CONSTRAINT pk_Cliente PRIMARY KEY (IdCliente)
    
);

# Creación de la tabla Pedido
CREATE TABLE Pedido (
    PedidoId INT NOT NULL AUTO_INCREMENT,
    Fecha DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    IdCliente INT NOT NULL,
    CONSTRAINT pk_Pedidot PRIMARY KEY (PedidoId),
    CONSTRAINT fk_Pedido_Clientet FOREIGN KEY (IdCliente)
    REFERENCES Cliente(IdCliente)
    
);

# Creación de la tabla DetallePedido
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