DROP DATABASE IF EXISTS "control1";

CREATE DATABASE "control1"
    WITH
    ENCODING = 'UTF8'
    LC_COLLATE = 'C'
    LC_CTYPE = 'C'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

\c control1

CREATE TABLE Comuna(
    ID_Comuna SERIAL NOT NULL,
    Nombre VARCHAR(30),
    Ubicacion VARCHAR(30),
    PRIMARY KEY (ID_Comuna)
);

CREATE TABLE Administrador(
    ID_Administrador SERIAL NOT NULL,
    Nombre VARCHAR(30),
    PRIMARY KEY (ID_Administrador)
);

CREATE TABLE Edificio(
    ID_Edificio SERIAL NOT NULL,
    Direccion VARCHAR(60),
    ID_Comuna INT,
    ID_Administrador INT,
    PRIMARY KEY (ID_Edificio),
    FOREIGN KEY (ID_Comuna) REFERENCES Comuna(ID_Comuna),
    FOREIGN KEY (ID_Administrador) REFERENCES Administrador(ID_Administrador)
);

CREATE TABLE Gasto_Edificio(
    ID_Gasto_Edificio SERIAL NOT NULL,
    Monto INT,
    PRIMARY KEY (ID_Gasto_Edificio)
);

CREATE TABLE Pago_Gasto_Edificio(
    ID_Pago_Gasto_Edificio SERIAL NOT NULL,
    Estado BOOL,
	Fecha_Emision DATE,
    ID_Edificio INT,
    ID_Gasto_Edificio INT,
    PRIMARY KEY (ID_Pago_Gasto_Edificio),
    FOREIGN KEY (ID_Edificio) REFERENCES Edificio(ID_Edificio),
    FOREIGN KEY (ID_Gasto_Edificio) REFERENCES Gasto_Edificio(ID_Gasto_Edificio)
);

CREATE TABLE Gasto_Comun(
    ID_Gasto_Comun SERIAL NOT NULL,
    Mantencion INT,
    Servicios INT,
    PRIMARY KEY (ID_Gasto_Comun)
);

CREATE TABLE Tipo_Depto(
    ID_Tipo_Depto SERIAL NOT NULL,
    Nombre VARCHAR(30) NOT NULL,
    Tamano INT,
    Banos INT,
    Habitaciones INT,
    Capacidad INT,
    ID_Gasto_Comun INT,
    PRIMARY KEY (ID_Tipo_Depto),
    FOREIGN KEY (ID_Gasto_Comun) REFERENCES Gasto_Comun(ID_Gasto_Comun)
);

CREATE TABLE Depto(
    ID_Depto SERIAL NOT NULL,
    Piso INT,
    Cant_Habitantes INT,
    ID_Tipo_Depto INT,
    ID_Edificio INT,
    PRIMARY KEY (ID_Depto),
    FOREIGN KEY (ID_Tipo_Depto) REFERENCES Tipo_Depto(ID_Tipo_Depto),
    FOREIGN KEY (ID_Edificio) REFERENCES Edificio(ID_Edificio)
);

CREATE TABLE Pago_Gasto_Depto(
    ID_Pago_Gasto_Depto SERIAL NOT NULL,
    Fecha_Emision DATE,
    Fecha_Limite DATE,
    Fecha_Pago DATE,
    ID_Depto INT,
    ID_Gasto_Comun INT,
    PRIMARY KEY (ID_Pago_Gasto_Depto),
    FOREIGN KEY (ID_Depto) REFERENCES Depto(ID_Depto),
    FOREIGN KEY (ID_Gasto_Comun) REFERENCES Gasto_Comun(ID_Gasto_Comun)
);











