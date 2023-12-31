--POBLAR Comuna

INSERT INTO Comuna (Nombre, Ubicacion)
VALUES
    ('Santiago', 'Región Metropolitana'),
    ('Providencia', 'Región Metropolitana'),
    ('Las Condes', 'Región Metropolitana'),
    ('La Serena', 'Coquimbo'),
    ('Valparaíso', 'Valparaíso'),
    ('Viña del Mar', 'Valparaíso'),
    ('Concepción', 'Biobío'),
    ('Talcahuano', 'Biobío'),
    ('Arica', 'Arica y Parinacota'),
    ('Iquique', 'Tarapacá'),
    ('Antofagasta', 'Antofagasta'),
    ('La Calera', 'Valparaíso'),
    ('Punta Arenas', 'Magallanes y Antártica'),
    ('Rancagua', 'O Higgins'),
    ('Copiapó', 'Atacama'),
    ('Osorno', 'Los Lagos'),
    ('Temuco', 'la Araucanía'),
    ('Valdivia', 'Los Ríos'),
    ('Curicó', 'Maule'),
    ('Los Ángeles', 'Biobío'),
    ('Puerto Montt', 'Los Lagos'),
    ('Calama', 'Antofagasta'),
    ('Chillán', 'Biobío'),
    ('San Antonio', 'Valparaíso'),
    ('Coquimbo', 'Coquimbo'),
    ('Talca', 'Maule'),
    ('Iquique', 'Tarapacá'),
    ('Quillota', 'Valparaíso');



--POBLAR Administrador

INSERT INTO Administrador (Nombre) VALUES
    ('Aitor Tilla'),
    ('Alba Sura'),
    ('Alex Cremento'),
    ('Aquiles Bailo'),
    ('Andrés Trozado'),
    ('Armando Bronca Segura'),
    ('Dolores Delano'),
    ('Elba Surero'),
    ('Elton Tito'),
    ('Ema Amado Bustos'),
    ('Helen Chufe'),
    ('Inés Tornudo'),
    ('Jazmín Decisa'),
    ('Josefa Nática'),
    ('Juanjo Sefina'),
    ('Lola Mento'),
    ('Matías Queroso'),
    ('Rubén D. Moniado'),
    ('Vicente Levidente'),
    ('Zacarías Flores Del Campo');

--POBLAR Edificio
INSERT INTO Edificio (Direccion, ID_Comuna, ID_Administrador) VALUES
    ('Calle Moneda 123', 1, 1),
    ('Franklin', 1, 2),
    ('Calle Agustinas 789', 1, 3),
    ('Avenida Alameda 1011', 1, 4),
    ('Calle Amunátegui 1314', 1, 5);




--POBLAR Gasto_Edificio

INSERT INTO Gasto_Edificio (Monto) VALUES
(1250000),
(1670000),
(1980000),
(1120000),
(1365000),
(1798000),
(1542000),
(1873000),
(1137000),
(1458000),
(1995000),
(1576000),
(1894000),
(1229000),
(1653000),
(1347000),
(1782000),
(1436000),
(1957000),
(1184000),
(1618000),
(1991000),
(1312000),
(1736000),
(1863000),
(1067000),
(1549000),
(1191000),
(1935000),
(1710000);


--POBLAR Pago_Gasto_edificio

INSERT INTO Pago_Gasto_Edificio (Estado, Fecha_Emision, ID_Edificio, ID_Gasto_Edificio) VALUES
(true, '2023-09-13', 1, 1),
(false, '2023-09-13', 1, 2),
(true, '2023-09-13', 1, 3),
(false, '2023-09-13', 1, 4),
(true, '2023-10-13',1, 5),
(false, '2023-11-13',1, 6),
(true, '2023-09-13',2, 7),
(false, '2023-09-13',2, 8),
(true, '2023-09-13',2, 9),
(false, '2023-10-13',2, 10),
(true, '2023-10-13',2, 11),
(false, '2023-11-13',2, 12),
(true, '2023-09-13',3, 13),
(false, '2023-09-13',3, 14),
(true, '2023-10-13',3, 15),
(false, '2023-10-13',3, 16),
(true, '2023-11-13',3, 17),
(false, '2023-11-13',3, 18),
(true, '2023-09-13',4, 19),
(false, '2023-09-13',4, 20),
(true, '2023-10-13',4, 21),
(false, '2023-10-13',4, 22),
(true, '2023-11-13',4, 23),
(false, '2023-12-13',4, 24),
(true, '2023-09-13',5, 25),
(false, '2023-09-13',5, 26),
(true, '2023-10-13',5, 27),
(false, '2023-10-13',5, 28),
(true, '2023-11-13',5, 29),
(false, '2023-11-13',5, 30);


--POBLAR Gasto_Comun
INSERT INTO Gasto_Comun (Mantencion, Servicios) VALUES
    (100000, 0),
    (100000, 50000),
    (100000, 100000),
    (150000, 0),
    (150000, 50000),
    (150000, 100000),
    (200000, 0),
    (200000, 50000),
    (200000, 100000);


--POBLAR Tipo_Depto

INSERT INTO Tipo_Depto (Nombre, Tamano, Banos, Habitaciones, Capacidad, ID_Gasto_Comun) VALUES
('Individual', 45, 1, 1, 2, 1),
('Pequeño', 55, 1, 1, 2, 1),
('Pequeño B', 65, 1, 1, 2, 4),
('Mediano', 75, 1, 1, 2, 4),
('Mediano B', 85, 1, 2, 2, 5),
('Mediano C', 95, 2, 2, 4, 5),
('Grande', 105, 2, 2, 4, 5),
('Familiar', 125, 2, 2, 4, 7),
('Suite', 145, 2, 3, 6, 8),
('Premium', 200, 3, 3, 6, 9);

--POBLAR Depto

INSERT INTO Depto (Piso, Cant_Habitantes, ID_Tipo_Depto, ID_Edificio) VALUES
(1, 2, 1, 1),
(1, 2, 2, 1),
(2, 2, 3, 1),
(2, 2, 4, 1),
(3, 4, 6, 1),
(3, 4, 7, 1),
(4, 4, 6, 1),
(4, 4, 8, 1),
(5, 6, 9, 1),
(5, 6, 10, 1),
(1, 2, 2, 2),
(2, 3, 3, 2),
(3, 4, 6, 2),
(4, 6, 7, 2),
(3, 4, 7, 3),
(1, 2, 2, 3),
(3, 5, 8, 4),
(3, 4, 7, 4),
(3, 4, 8, 4),
(3, 5, 7, 4),
(3, 3, 6, 4),
(4, 5, 7, 4),
(4, 5, 8, 4),
(5, 5, 8, 4),
(5, 5, 7, 4),
(5, 4, 7, 4),
(3, 4, 5, 5),
(5, 6, 9, 5);

--POBLAR Pago_Gasto_Depto

INSERT INTO Pago_Gasto_Depto (Fecha_Emision, Fecha_Limite, Fecha_Pago, ID_Depto, ID_Gasto_Comun) VALUES
('2023-08-13', '2023-09-13', '2023-08-13', 1, 1),
('2023-08-13', '2023-09-13', NULL, 2, 1),
('2023-08-13', '2023-09-13', '2023-08-13', 3, 4),
('2023-08-13', '2023-09-13', '2023-08-13', 4, 4),
('2023-08-13', '2023-09-13', '2023-08-13', 5, 5),
('2023-08-13', '2023-09-13', NULL, 6, 5),
('2023-08-13', '2023-09-13', '2023-08-13', 7, 5),
('2023-08-13', '2023-09-13', '2023-08-13', 8, 8),
('2023-08-13', '2023-09-13', '2023-08-13', 9, 8),
('2023-08-13', '2023-09-13', NULL, 10, 5),
('2023-08-13', '2023-09-13', '2023-09-13', 11, 5),
('2023-08-13', '2023-09-13', '2023-09-13', 12, 7),
('2023-08-13', '2023-09-13', '2023-09-13', 13, 5),
('2023-08-13', '2023-09-13', '2023-09-13', 14, 2),
('2023-08-13', '2023-09-13', NULL, 15, 1),
('2023-08-13', '2023-09-13', NULL, 16, 8),

('2023-07-13', '2023-08-13', '2023-08-20', 1, 1),
('2023-07-13', '2023-08-13', '2023-08-13', 2, 1),
('2023-07-13', '2023-08-13', '2023-08-13', 3, 4),
('2023-07-13', '2023-08-13', '2023-08-13', 4, 4),
('2023-07-13', '2023-08-13', '2023-08-13', 5, 5),
('2023-07-13', '2023-08-13', '2023-08-13', 6, 5),
('2023-07-13', '2023-08-13', '2023-08-13', 7, 5),
('2023-07-13', '2023-08-13', '2023-08-13', 8, 8),
('2023-07-13', '2023-08-13', '2023-08-01', 9, 8),
('2023-07-13', '2023-08-13', '2023-08-13', 10, 5),
('2023-07-13', '2023-08-13', '2023-08-13', 11, 5),
('2023-07-13', '2023-08-13', '2023-08-23', 12, 7),
('2023-07-13', '2023-08-13', '2023-08-13', 13, 5),
('2023-07-13', '2023-08-13', '2023-08-13', 14, 2),
('2023-07-13', '2023-08-13', '2023-08-23', 15, 1),
('2023-07-13', '2023-08-13', '2023-08-13', 16, 8),

('2023-06-13', '2023-07-13', '2023-07-13', 1, 1),
('2023-06-13', '2023-07-13', '2023-07-13', 2, 1),
('2023-06-13', '2023-07-13', '2023-07-25', 3, 4),
('2023-06-13', '2023-07-13', '2023-07-13', 4, 4),
('2023-06-13', '2023-07-13', '2023-07-13', 5, 5),
('2023-06-13', '2023-07-13', '2023-07-20', 6, 5),
('2023-06-13', '2023-07-13', '2023-07-13', 7, 5),
('2023-06-13', '2023-07-13', '2023-07-13', 8, 7),
('2023-06-13', '2023-07-13', '2023-07-13', 9, 8),
('2023-06-13', '2023-07-13', '2023-07-13', 10, 5),
('2023-06-13', '2023-07-13', '2023-07-23', 11, 5),
('2023-06-13', '2023-07-13', '2023-07-13', 12, 7),
('2023-06-13', '2023-07-13', '2023-07-23', 13, 5),
('2023-06-13', '2023-07-13', '2023-07-13', 14, 2),
('2023-06-13', '2023-07-13', '2023-07-23', 15, 1),
('2023-06-13', '2023-07-13', '2023-07-13', 16, 8);