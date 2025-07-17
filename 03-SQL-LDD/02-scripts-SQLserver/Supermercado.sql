USE examenes;
GO

-- Tabla Suppliers 
CREATE TABLE Suppliers (
    SupplierId INT NOT NULL IDENTITY(1,1),
    CompanyName NVARCHAR(20) NOT NULL,
    Address NVARCHAR(50) NOT NULL, 
    Fax NVARCHAR(20) NULL,  
    City NVARCHAR(20) NOT NULL,
    Region NVARCHAR(20) NULL,  
    HomePage NVARCHAR(50) NULL,  
    CONSTRAINT PK_Suppliers  
    PRIMARY KEY(SupplierId)  
);
GO

-- Tabla Categories 
CREATE TABLE Categories (
    CategoryId INT NOT NULL IDENTITY(1,1),
    CategoryName NVARCHAR(20) NOT NULL,  
    Description NVARCHAR(100) NOT NULL,  
    CONSTRAINT PK_CategoryId 
    PRIMARY KEY(CategoryId),
    CONSTRAINT UK_CategoryName  
    UNIQUE(CategoryName)
);
GO

-- Tabla Products
CREATE TABLE Products (
    ProductId INT NOT NULL IDENTITY(1,1),  
    ProductName NVARCHAR(20) NOT NULL,
    UnitPrice MONEY NOT NULL,
    UnitsInStock INT NOT NULL,  
    QuantityPerUnit NVARCHAR(20) NOT NULL,  
    SupplierId INT NOT NULL,  
    CategoryId INT NOT NULL,
    CONSTRAINT PK_Products
    PRIMARY KEY(ProductId),
    CONSTRAINT CHK_UnitPrice
    CHECK(UnitPrice > 0.0),
    CONSTRAINT UK_ProductName 
    UNIQUE(ProductName),
    CONSTRAINT FK_SupplierId  
    FOREIGN KEY(SupplierId)
    REFERENCES Suppliers(SupplierId), 
    CONSTRAINT FK_CategoryId
    FOREIGN KEY(CategoryId)
    REFERENCES Categories(CategoryId)
);
GO



-- Tabla ContactSuppliers 
CREATE TABLE ContactSuppliers (  
    ContactId INT NOT NULL IDENTITY(1,1),
    SupplierId INT NOT NULL,  
    FullName NVARCHAR(50) NOT NULL, 
    CONSTRAINT PK_ContactId
    PRIMARY KEY(ContactId),
    CONSTRAINT FK_SupplierId_Suppliers  
    FOREIGN KEY(SupplierId)
    REFERENCES Suppliers(SupplierId)  
);
GO


CREATE TABLE Employees (
    EmployeeId INT NOT NULL IDENTITY(1,1),
    ReportTo INT NULL,  
    FirstName NVARCHAR(20) NOT NULL,
    LastName NVARCHAR(20) NOT NULL,
    BirthDate DATE NOT NULL, 
    City NVARCHAR(50) NOT NULL,
    CONSTRAINT PK_EmployeeId  
    PRIMARY KEY(EmployeeId),
    CONSTRAINT FK_ReportTo
    FOREIGN KEY(ReportTo)
    REFERENCES Employees(EmployeeId)
);
GO

-- Tabla Customers 
CREATE TABLE Customers (
    CustomerId INT NOT NULL IDENTITY(1,1),
    CompanyName NVARCHAR(50) NOT NULL,  
    City NVARCHAR(20) NOT NULL,
    Region NVARCHAR(20) NULL,  
    Phone NVARCHAR(20) NOT NULL,  
    CONSTRAINT PK_Customers  
    PRIMARY KEY(CustomerId)
);
GO

-- Tabla ContactCustomers 
CREATE TABLE ContactCustomers (
    ContactId INT NOT NULL IDENTITY(1,1),
    CustomerId INT NOT NULL,
    FullName NVARCHAR(50) NOT NULL,  
    CONSTRAINT PK_ContactCustomers
    PRIMARY KEY(ContactId),
    CONSTRAINT FK_CustomerId_Customers
    FOREIGN KEY(CustomerId)
    REFERENCES Customers(CustomerId)
);
GO

-- Tabla Shippers 
CREATE TABLE Shippers (
    ShipperId INT NOT NULL IDENTITY(1,1),  
    CompanyName NVARCHAR(50) NOT NULL, 
    CONSTRAINT PK_Shippers  
    PRIMARY KEY(ShipperId)
);
GO

-- Tabla PhoneShipper
CREATE TABLE PhoneShipper ( 
    PhoneShipperId INT NOT NULL IDENTITY(1,1),
    ShipperId INT NOT NULL,
    Phone NVARCHAR(20) NOT NULL,  
    CONSTRAINT PK_PhoneShipperId
    PRIMARY KEY(PhoneShipperId),
    CONSTRAINT FK_ShipperId_Shippers  
    FOREIGN KEY(ShipperId)
    REFERENCES Shippers(ShipperId)
);
GO

-- Tabla Orders 
CREATE TABLE Orders (
    OrderId INT NOT NULL IDENTITY(1,1),
    Code NVARCHAR(20) NOT NULL,  
    ShipRegion INT NOT NULL,  
    OrderDate DATE NOT NULL,
    RequiredDate DATE NOT NULL,  
    EmployeeId INT NOT NULL,  
    CustomerId INT NOT NULL,
    CONSTRAINT PK_Orders 
    PRIMARY KEY(OrderId),
    CONSTRAINT FK_EmployeeId_Orders  
    FOREIGN KEY(EmployeeId)
    REFERENCES Employees(EmployeeId),
    CONSTRAINT FK_Customers_Orders
    FOREIGN KEY(CustomerId)
    REFERENCES Customers(CustomerId),
    CONSTRAINT FK_Shippers_Orders
    FOREIGN KEY(ShipRegion)
    REFERENCES Shippers(ShipperId)
);
GO


CREATE TABLE Details (
    ProductId INT NOT NULL,
    OrderId INT NOT NULL,
    UnitPrice MONEY NOT NULL,
    Quantity INT NOT NULL,
    Discount DECIMAL(5,2) NOT NULL, 
    CONSTRAINT PK_Details 
    PRIMARY KEY(ProductId, OrderId),
    CONSTRAINT FK_ProductId_Details
    FOREIGN KEY(ProductId)
    REFERENCES Products(ProductId),
    CONSTRAINT FK_OrderId_Details
    FOREIGN KEY(OrderId)
    REFERENCES Orders(OrderId),
    CONSTRAINT CHK_UnitPriceDetails
    CHECK(UnitPrice > 0.0 AND UnitPrice < 2000),
    CONSTRAINT CHK_Discount 
    CHECK(Discount >= 0.0 AND Discount <= 1.0),  
    CONSTRAINT CHK_Quantity
    CHECK(Quantity > 0)
);
GO