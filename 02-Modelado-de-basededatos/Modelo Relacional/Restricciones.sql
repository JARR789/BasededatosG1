-- Crear Base de Dates
CREATE DATABASE restriccionesdbg1;

--Utilizat la base de datos 
USE restriccionesdbg1;

--Crear tabla categoria
DROP TABLE categoria;
CREATE TABLE categoria(
	categoriaid int,
	nombre nvarchar(30)
);

INSERT INTO categoria
VALUES(1,'Carnes Frias');

SELECT * FROM categoria;

INSERT INTO categoria
VALUES(1,'Vinos y Licores');

SELECT * FROM categoria;

INSERT INTO categoria
VALUES(null,'Ropa');

SELECT * FROM categoria;

INSERT INTO categoria
VALUES(1,'Vinos y Licores');

SELECT * FROM categoria;                                                                                                                                                                                                                                                                                                                                                  

DROP TABLE categoria;

CREATE TABLE categoria (
	categoriaid int not null,
	nombre nvarchar(30),
	constraint pk_categoria
	primary key(categoriaid),
);
INSERT INTO categoria
VALUES(1,'Carnes Frias');

SELECT * FROM categoria;

INSERT INTO categoria
VALUES(2,'Vinos y Licores');

SELECT * FROM categoria;

INSERT INTO categoria
VALUES(3,'Ropa');

SELECT * FROM categoria;

INSERT INTO categoria
VALUES(4,'Ropa');

SELECT * FROM categoria;

DROP TABLE categoria;

CREATE TABLE categoria (
	categoriaid int not null,
	nombre nvarchar(30) not null,
	constraint pk_categoria
	primary key(categoriaid),
	constraint unique_nombre
	unique(nombre)
);

DROP TABLE producto;

CREATE TABLE producto (
	productoid int not null,
	nombrepord nvarchar(20) not null,
	precio money not null,
	existencia numeric(10,2) not null,
	categoriaid int
	constraint pk_producto
	primary key(productoid),
	constraint unique_nombreprod
	unique(nombrepord),
	constraint chk_precio
	check(precio>0 and precio<=4000),
	constraint chk_existencia
	check(existencia>=0),
	constraint fk_producto_categoria
	foreign key (categoriaid)
	references categoria (categoriaid)
);

INSERT INTO categoria
VALUES(1,'Carnes Frias');

SELECT * FROM categoria;

INSERT INTO categoria
VALUES(2,'Vinos y Licores');

INSERT INTO categoria
VALUES(8,'Ropas Chinas');

INSERT INTO producto
values (1, 'Tonayan', 4000, 4, 2)

INSERT INTO producto
values (2, 'Tonayan2', 1250.6, 40, 2)

INSERT INTO producto
values (3, 'Bucañas', 200, 8, 2)

INSERT INTO producto
values (4, 'Calzon Chino', 6.3, 890, 8);

SELECT *
from producto as p
INNER JOIN categoria as c
ON c.categoriaid = p.categoriaid;

 