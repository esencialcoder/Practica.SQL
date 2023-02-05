--DDL

CREATE SCHEMA dbRoyal authorization xkktgunw; 
SET search_path TO dbRoyal;

create table dbRoyal.Moneda
(
id serial primary key,
nombre varchar(100) not null,
abreviacion varchar(10) not null
);

create table dbroyal.Aseguradora
(
id serial primary key,
nombre varchar(100) not null
);

create table dbRoyal.Color
(
id serial primary key,
nombre varchar(100) not null
);

create table dbRoyal.Grupo_Empresarial
(
id serial primary key,
nombre varchar(250) not null
);

create table dbRoyal.Marca
(
id serial primary key,
nombre varchar(250) not null,
grupo_empresarial_id INT REFERENCES Grupo_Empresarial(id) null
);


create table dbRoyal.Modelo
(
id serial primary key,
nombre varchar(250) not null,
anio_lanzamiento int not null,
marca_id INT REFERENCES Marca(id)
);


create table dbRoyal.Coche 
(
id SERIAL primary key,
matricula VARCHAR(30) not null,
km INT not null,
fecha_compra DATE not null,
status int default 1 NOT null,
color_id INT references Color(id),
modelo_id INT references Modelo(id)
);

create table dbRoyal.Poliza
(
id serial primary key,
numero_poliza varchar(50) not null,
fecha_inicio DATE not null,
fecha_fin DATE not null,
costo  NUMERIC(10,2) not null,
estado int default 1 not null,
coche_id INT REFERENCES Coche(id),
aseguradora_id INT REFERENCES Aseguradora(id)
);

create table dbRoyal.Revisiones
(
id SERIAL primary key,
km INT not null,
fecha DATE not null,
importe numeric(10,2) not null,
coche_id INT references Coche(id),
moneda_id INT references Moneda(id)
);

--DML

-- Inserto datos en "dbRoyal.Moneda":

INSERT INTO dbRoyal.Moneda (nombre, abreviacion) VALUES ('Dólar Americano', 'USD');
INSERT INTO dbRoyal.Moneda (nombre, abreviacion) VALUES ('Euro', 'EUR');
INSERT INTO dbRoyal.Moneda (nombre, abreviacion) VALUES ('Libra', 'GBP');

-- Inserto datos en "dbRoyal.Aseguradora":

INSERT INTO dbRoyal.Aseguradora (nombre) VALUES ('Seguros Axa');
INSERT INTO dbRoyal.Aseguradora (nombre) VALUES ('Seguros Bilbao');
INSERT INTO dbRoyal.Aseguradora (nombre) VALUES ('Seguros Royal');
INSERT INTO dbRoyal.Aseguradora (nombre) VALUES ('Seguros Mapfre');
INSERT INTO dbRoyal.Aseguradora (nombre) VALUES ('Seguros Allianz');

-- Inserto datos en "dbRoyal.Color":

INSERT INTO dbRoyal.Color (nombre) VALUES ('Rojo');
INSERT INTO dbRoyal.Color (nombre) VALUES ('Azul');
INSERT INTO dbRoyal.Color (nombre) VALUES ('Negro');
INSERT INTO dbRoyal.Color (nombre) VALUES ('Metalico');
INSERT INTO dbRoyal.Color (nombre) VALUES ('Verde');

-- Inserto datos en "dbRoyal.Grupo_Empresarial":

INSERT INTO dbRoyal.Grupo_Empresarial (nombre) VALUES ('GM');
INSERT INTO dbRoyal.Grupo_Empresarial (nombre) VALUES ('Ford');
INSERT INTO dbRoyal.Grupo_Empresarial (nombre) VALUES ('Chrysler');
INSERT INTO dbRoyal.Grupo_Empresarial (nombre) VALUES ('Mercedez Benz Group');
INSERT INTO dbRoyal.Grupo_Empresarial (nombre) VALUES ('Seat S.A.');

-- Inserto datos en "dbRoyal.Marca":

INSERT INTO dbRoyal.Marca (nombre, grupo_empresarial_id) VALUES ('Chevrolet', 1);
INSERT INTO dbRoyal.Marca (nombre, grupo_empresarial_id) VALUES ('Cadillac', 1);
INSERT INTO dbRoyal.Marca (nombre, grupo_empresarial_id) VALUES ('Lincoln', 2);
INSERT INTO dbRoyal.Marca (nombre, grupo_empresarial_id) VALUES ('Mercedez', 4);
INSERT INTO dbRoyal.Marca (nombre, grupo_empresarial_id) VALUES ('Seat', 5);

-- Inserto datos en "dbRoyal.Modelo":

INSERT INTO dbRoyal.Modelo (nombre, anio_lanzamiento, marca_id) VALUES ('Camaro', 2022, 1);
INSERT INTO dbRoyal.Modelo (nombre, anio_lanzamiento, marca_id) VALUES ('Impala', 2022, 1);
INSERT INTO dbRoyal.Modelo (nombre, anio_lanzamiento, marca_id) VALUES ('Town Car', 2022, 2);
INSERT INTO dbRoyal.Modelo (nombre, anio_lanzamiento, marca_id) VALUES ('A4', 2001, 4);
INSERT INTO dbRoyal.Modelo (nombre, anio_lanzamiento, marca_id) VALUES ('Panda', 2005, 5);

-- Inserto datos en "dbRoyal.Coche":

INSERT INTO dbRoyal.Coche (matricula, km, fecha_compra, color_id, modelo_id) VALUES ('ABC123', 100, '2023-01-15', 1, 1);
INSERT INTO dbRoyal.Coche (matricula, km, fecha_compra, color_id, modelo_id,status) VALUES ('DEF456', 200, '2023-01-21', 2, 2,0);
INSERT INTO dbRoyal.Coche (matricula, km, fecha_compra, color_id, modelo_id) VALUES ('GHI789', 300, '2023-01-11', 3, 3);
INSERT INTO dbRoyal.Coche (matricula, km, fecha_compra, color_id, modelo_id) VALUES ('FH1943', 800, '2023-03-29', 4, 4);
INSERT INTO dbRoyal.Coche (matricula, km, fecha_compra, color_id, modelo_id,status) VALUES ('OH1955', 900, '2023-04-30', 5, 5,0);

-- Inserto datos en "dbRoyal.Poliza":

INSERT INTO dbRoyal.Poliza (numero_poliza,  fecha_inicio, fecha_fin, costo, aseguradora_id,coche_id) VALUES ('A123', '2022-01-01', '2023-01-01', 100, 1,1);
INSERT INTO dbRoyal.Poliza (numero_poliza,  fecha_inicio, fecha_fin, costo, aseguradora_id,coche_id) VALUES ('B456', '2022-01-01', '2023-01-01', 200, 2,2);
INSERT INTO dbRoyal.Poliza (numero_poliza,  fecha_inicio, fecha_fin, costo, aseguradora_id,coche_id) VALUES ('C789',  '2022-01-01', '2023-01-01', 300, 3,3);
INSERT INTO dbRoyal.Poliza (numero_poliza,  fecha_inicio, fecha_fin, costo, aseguradora_id,coche_id) VALUES ('C710','2022-05-01', '2023-01-29', 500, 4,4);
INSERT INTO dbRoyal.Poliza (numero_poliza,  fecha_inicio, fecha_fin, costo, aseguradora_id,coche_id) VALUES ('C510', '2022-02-01', '2023-02-28', 300,5,5);

-- Inserto datos en "dbRoyal.Revisiones":

INSERT INTO dbRoyal.Revisiones (km, fecha, importe, coche_id, moneda_id) VALUES (100, '2022-01-01', 50, 1, 1);
INSERT INTO dbRoyal.Revisiones (km, fecha, importe, coche_id, moneda_id) VALUES (200, '2020-05-01', 100, 2, 2);
INSERT INTO dbRoyal.Revisiones (km, fecha, importe, coche_id, moneda_id) VALUES (300, '2021-06-01', 150, 3, 3);
INSERT INTO dbRoyal.Revisiones (km, fecha, importe, coche_id, moneda_id) VALUES (1800, '2023-02-01', 270, 4, 2);
INSERT INTO dbRoyal.Revisiones (km, fecha, importe, coche_id, moneda_id) VALUES (1900, '2023-02-21', 270, 5, 2);

