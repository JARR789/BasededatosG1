CREATE DATABASE Examen1
USE Examen1
GO
-- Tablas base (para referencias)
CREATE TABLE AIRPORT (
    Airport_code VARCHAR(3) CONSTRAINT PK_AIRPORT PRIMARY KEY,
    City VARCHAR(50) NOT NULL,
    State VARCHAR(50) NOT NULL,
    Name VARCHAR(100) NOT NULL
);

CREATE TABLE AIRPLANE_TYPE (
    Type_name VARCHAR(50) CONSTRAINT PK_AIRPLANE_TYPE PRIMARY KEY,
    Max_seats INT NOT NULL CONSTRAINT CHK_Max_seats CHECK (Max_seats > 0),
    Company VARCHAR(50) NOT NULL
);

CREATE TABLE FLIGHT (
    Number VARCHAR(10) CONSTRAINT PK_FLIGHT PRIMARY KEY,
    Airline VARCHAR(50) NOT NULL,
    Restrictions VARCHAR(100)
);

CREATE TABLE FLIGHT_LEG (
    Leg_no INT IDENTITY(1,1) CONSTRAINT PK_FLIGHT_LEG PRIMARY KEY,
    Flight_number VARCHAR(10) NOT NULL,
    Scheduled_dep_time DATETIME NOT NULL,
    Scheduled_arr_time DATETIME NOT NULL,
    Departure_airport_code VARCHAR(3)NOT NULL,
    Arrival_airport_code VARCHAR(3)NOT NULL,
    CONSTRAINT FK_FLIGHT_LEG_FLIGHT FOREIGN KEY (Flight_number) REFERENCES FLIGHT(Number),
    CONSTRAINT FK_FLIGHT_LEG_DEP_AIRPORT FOREIGN KEY (Departure_airport_code) REFERENCES AIRPORT(Airport_code),
    CONSTRAINT FK_FLIGHT_LEG_ARR_AIRPORT FOREIGN KEY (Arrival_airport_code) REFERENCES AIRPORT(Airport_code),
    CONSTRAINT CHK_FLIGHT_LEG_TIMES CHECK (Scheduled_arr_time > Scheduled_dep_time)
);

CREATE TABLE AIRPLANE (
    Airplane_id INT IDENTITY(1,1) CONSTRAINT PK_AIRPLANE PRIMARY KEY,
    Total_no_of_seats INT NOT NULL CONSTRAINT CHK_Total_seats CHECK (Total_no_of_seats > 0),
    Type_name VARCHAR(50) NOT NULL,
    CONSTRAINT FK_AIRPLANE_TYPE FOREIGN KEY (Type_name) REFERENCES AIRPLANE_TYPE(Type_name)
);

-- Tabla LEG_INSTANCE (ajustada según imagen)
CREATE TABLE LEG_INSTANCE (
    Leg_no INT NOT NULL,
    Date DATE NOT NULL,
    Flight_number VARCHAR(10) NOT NULL,
    Airplane_id INT NOT NULL,
    Dep_time DATETIME NOT NULL,
    Arr_time DATETIME NOT NULL,
    No_of_available_seats INT NOT NULL,
    
    CONSTRAINT PK_LEG_INSTANCE PRIMARY KEY (Leg_no, Date),
    
    -- Foreign Keys válidas (4 relaciones esenciales)
    CONSTRAINT FK_LEG_INSTANCE_LEG FOREIGN KEY (Leg_no) 
        REFERENCES FLIGHT_LEG(Leg_no) ON DELETE CASCADE,
        
    CONSTRAINT FK_LEG_INSTANCE_FLIGHT FOREIGN KEY (Flight_number) 
        REFERENCES FLIGHT(Number),
        
    CONSTRAINT FK_LEG_INSTANCE_AIRPLANE FOREIGN KEY (Airplane_id) 
        REFERENCES AIRPLANE(Airplane_id),
    
    -- Restricción de tiempos
    CONSTRAINT CHK_LEG_INSTANCE_TIMES CHECK (Arr_time > Dep_time),
    
    -- Restricción de asientos disponibles
    CONSTRAINT CHK_LEG_INSTANCE_SEATS CHECK (No_of_available_seats >= 0)
);
DROP TABLE LEG_INSTANCE
-- Tabla SEAT (ajustada según imagen)
CREATE TABLE SEAT (
    Seat_no VARCHAR(10) NOT NULL,
    Leg_no INT NOT NULL,
    Date DATE NOT NULL,
    Flight_number VARCHAR(10) NOT NULL,
    Airplane_id INT NOT NULL,
    Customer_name VARCHAR(100) NOT NULL,
    Phone VARCHAR(20),
    
    CONSTRAINT PK_SEAT PRIMARY KEY (Seat_no, Leg_no, Date),
    
    -- Foreign Keys válidas (3 relaciones esenciales)
    CONSTRAINT FK_SEAT_LEG_INSTANCE FOREIGN KEY (Leg_no, Date) 
        REFERENCES LEG_INSTANCE(Leg_no, Date) ON DELETE CASCADE,
        
    CONSTRAINT FK_SEAT_FLIGHT FOREIGN KEY (Flight_number) 
        REFERENCES FLIGHT(Number),
        
    CONSTRAINT FK_SEAT_AIRPLANE FOREIGN KEY (Airplane_id) 
        REFERENCES AIRPLANE(Airplane_id)
);

-- Tablas adicionales necesarias para FKs:
CREATE TABLE FARE (
    Code VARCHAR(10) CONSTRAINT PK_FARE PRIMARY KEY,
    Amount DECIMAL(10, 2) NOT NULL CONSTRAINT CHK_FARE_AMOUNT CHECK (Amount > 0),
	Restrictions VARCHAR(100),
	Flight_number VARCHAR(10) NOT NULL
    
    -- Foreign Key explícita
    CONSTRAINT FK_FARE_FLIGHT FOREIGN KEY (Flight_number) REFERENCES FLIGHT(Number)
);

CREATE TABLE CAN_LAND (
    Airport_code VARCHAR(3) NOT NULL,
    Type_name VARCHAR(50) NOT NULL,
    
    CONSTRAINT PK_CAN_LAND PRIMARY KEY (Airport_code, Type_name),
    CONSTRAINT FK_CAN_LAND_AIRPORT FOREIGN KEY (Airport_code) REFERENCES AIRPORT(Airport_code),
    CONSTRAINT FK_CAN_LAND_AIRPLANE_TYPE FOREIGN KEY (Type_name) REFERENCES AIRPLANE_TYPE(Type_name)
);
