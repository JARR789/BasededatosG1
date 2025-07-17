USE examenes;

# Tabla Suppliers
CREATE TABLE Suppliers (
    SupplierId INT NOT NULL AUTO_INCREMENT,
    CompanyName VARCHAR(20) NOT NULL,
    Address VARCHAR(50) NOT NULL,
    Fax VARCHAR(20) NULL,
    City VARCHAR(20) NOT NULL,
    Region VARCHAR(20) NULL,
    HomePage VARCHAR(50) NULL,
    CONSTRAINT PK_Suppliers
    PRIMARY KEY(SupplierId)
    
);

# Tabla Categories
CREATE TABLE Categories (
    CategoryId INT NOT NULL AUTO_INCREMENT,
    CategoryName VARCHAR(20) NOT NULL,
    Description VARCHAR(100) NOT NULL,
    CONSTRAINT PK_CategoryId
    PRIMARY KEY(CategoryId),
    CONSTRAINT UK_CategoryName
    UNIQUE(CategoryName),
    );
);

# Tabla Products
CREATE TABLE Products (
    ProductId INT NOT NULL AUTO_INCREMENT,
    ProductName VARCHAR(20) NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL,
    UnitsInStock INT NOT NULL,
    QuantityPerUnit VARCHAR(20) NOT NULL,
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



# Tabla ContactSuppliers
CREATE TABLE ContactSuppliers (
    ContactId INT NOT NULL AUTO_INCREMENT,
    SupplierId INT NOT NULL,
    FullName VARCHAR(50) NOT NULL,
    CONSTRAINT PK_ContactId
    PRIMARY KEY(ContactId),
    CONSTRAINT FK_SupplierId_Suppliers
    FOREIGN KEY(SupplierId)
    REFERENCES Suppliers(SupplierId)
    
);


CREATE TABLE Employees (
    EmployeeId INT NOT NULL AUTO_INCREMENT,
    ReportTo INT NULL,
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(20) NOT NULL,
    BirthDate DATE NOT NULL,
    City VARCHAR(50) NOT NULL,
    CONSTRAINT PK_EmployeeId
    PRIMARY KEY(EmployeeId),
    CONSTRAINT FK_ReportTo
    FOREIGN KEY(ReportTo)
    REFERENCES Employees(EmployeeId)

);

# Tabla Customers
CREATE TABLE Customers (
    CustomerId INT NOT NULL AUTO_INCREMENT,
    CompanyName VARCHAR(50) NOT NULL,
    City VARCHAR(20) NOT NULL,
    Region VARCHAR(20) NULL,
    Phone VARCHAR(20) NOT NULL,
    CONSTRAINT PK_Customers
    PRIMARY KEY(CustomerId)
    
);

# Tabla ContactCustomers
CREATE TABLE ContactCustomers (
    ContactId INT NOT NULL AUTO_INCREMENT,
    CustomerId INT NOT NULL,
    FullName VARCHAR(50) NOT NULL,
    CONSTRAINT PK_ContactCustomers
    PRIMARY KEY(ContactId),
    CONSTRAINT FK_CustomerId_Customers
    FOREIGN KEY(CustomerId)
    REFERENCES Customers(CustomerId)
    
);

# Tabla Shippers
CREATE TABLE Shippers (
    ShipperId INT NOT NULL AUTO_INCREMENT,
    CompanyName VARCHAR(50) NOT NULL,
    CONSTRAINT PK_Shippers
    PRIMARY KEY(ShipperId)
    
);

# Tabla PhoneShipper
CREATE TABLE PhoneShipper (
    PhoneShipperId INT NOT NULL AUTO_INCREMENT,
    ShipperId INT NOT NULL,
    Phone VARCHAR(20) NOT NULL,
    CONSTRAINT PK_PhoneShipperId
    PRIMARY KEY(PhoneShipperId),
    CONSTRAINT FK_ShipperId_Shippers
    FOREIGN KEY(ShipperId)
    REFERENCES Shippers(ShipperId)
    
);

# Tabla Orders
CREATE TABLE Orders (
    OrderId INT NOT NULL AUTO_INCREMENT,
    Code VARCHAR(20) NOT NULL,
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


CREATE TABLE Details (
    ProductId INT NOT NULL,
    OrderId INT NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL,
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