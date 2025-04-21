-- Activar la extensión para UUIDs (solo necesitas hacer esto una vez)
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

--Crear la tabla camioneros
CREATE TABLE camioneros
(
    dpi bigint primary key ,
    nombre varchar(30),
    telefono varchar(20),
    direccion text,
    salario numeric(10,2)
);

CREATE TABLE camiones(
  placa varchar(10) primary key,
  modelo varchar(20),
  tipo varchar(20)
);

CREATE TABLE conduce_camionero
(
    fecha_conduccion date not null,
    dpi_camionero bigint,
    placa_camion varchar(10),
    primary key (fecha_conduccion, dpi_camionero, placa_camion),
    Foreign Key (dpi_camionero) REFERENCES camioneros(dpi),
    FOREIGN KEY (placa_camion) REFERENCES camiones(placa)
);

-- Tabla de Ciudades
CREATE TABLE ciudades (
    codigo_postal VARCHAR(10) PRIMARY KEY,
    nombre_ciudad VARCHAR(100) NOT NULL
);

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
select uuid_generate_v4();

CREATE TABLE paquetes (
    codigo_paquete uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
    descripcion TEXT NOT NULL,
    direccion_destinatario TEXT NOT NULL,
    camionero_dpi bigint NOT NULL,
    ciudad_codigo_postal VARCHAR(10) NOT NULL,
    FOREIGN KEY (camionero_dpi) REFERENCES camioneros(dpi),
    FOREIGN KEY (ciudad_codigo_postal) REFERENCES ciudades(codigo_postal)
);

SELECT uuid_generate_v4();  -- Debería devolver un UUID aleatorio

INSERT INTO camioneros (dpi, nombre, telefono, direccion, salario)
VALUES (1234567890123, 'Juan Pérez', '555-1234', 'Calle Falsa 123, Zona 1', 5000),
(2345678901234, 'María López', '555-5678', 'Avenida Siempre Viva 742', 5200),
(3456789012345, 'Carlos Gómez', '555-8765', 'Boulevard Los Próceres', 4800),
(4567890123456, 'Ana Martínez', '555-4321', 'Calzada Roosevelt', 5100),
(5678901234567, 'Pedro Sánchez', '555-6789', 'Ruta 6, Zona 4', 4950),
(6789012345678, 'Laura Herrera', '555-9876', 'Calle Martí, Zona 2', 5050),
(7890123456789, 'José Ramírez', '555-3456', 'Avenida Reforma, Zona 9', 5300),
(8901234567890, 'Sofía González', '555-6543', 'Diagonal 6, Zona 10', 4900),
(9012345678901, 'Miguel Torres', '555-7890', 'Calzada Aguilar Batres', 5150),
(1123456789012, 'Carmen Castillo', '555-3210', 'Anillo Periférico', 5250),
(2234567890123, 'Luis Méndez', '555-2109', 'Avenida Petapa, Zona 12', 5000),
(3345678901234, 'Patricia Rojas', '555-1098', 'Calle Montúfar, Zona 1', 5100),
(4456789012345, 'Andrés Fuentes', '555-0987', 'Avenida Hincapié, Zona 13', 5200),
(5567890123456, 'Gabriela Ruiz', '555-9870', 'Calzada San Juan, Zona 7', 4950),
(6678901234567, 'Fernando Silva', '555-8761', 'Bulevar Vista Hermosa', 5050);


INSERT INTO paquetes (descripcion, direccion_destinatario, camionero_dpi, ciudad_codigo_postal)
VALUES ('Electrónica', '5a Avenida 10-50, Zona 1', 1234567890123, '1001'),
('Ropa', '3a Calle 15-20, Zona 3', 2345678901234, '2002'),
('Libros', 'Avenida Las Américas 12-34, Zona 14', 3456789012345, '3003'),
('Muebles', 'Calzada Roosevelt 20-10, Zona 7', 4567890123456, '4004'),
('Juguetes', '6a Avenida 8-45, Zona 9', 5678901234567, '5005'),
('Electrodomésticos', 'Boulevard Los Próceres 25-50', 6789012345678, '6006'),
('Artículos deportivos', 'Ruta 6, 10-20, Zona 4', 7890123456789, '7007'),
('Cosméticos', 'Calle Martí 15-30, Zona 2', 8901234567890, '8008'),
('Alimentos no perecederos', 'Diagonal 6, 18-40, Zona 10', 9012345678901, '9009'),
('Material de oficina', 'Calzada Aguilar Batres 30-60', 1123456789012, '10010'),
('Herramientas', 'Anillo Periférico 5-25', 2234567890123, '11011'),
('Productos de limpieza', 'Avenida Petapa 12-15, Zona 12', 3345678901234, '12012'),
('Instrumentos musicales', 'Calle Montúfar 9-50, Zona 1', 4456789012345, '13013'),
('Accesorios para vehículos', 'Avenida Hincapié 7-80, Zona 13', 5567890123456, '14014'),
('Suministros médicos', 'Calzada San Juan 22-70, Zona 7', 6678901234567, '15015');


INSERT INTO ciudades (codigo_postal, nombre_ciudad)
VALUES ('1001', 'Ciudad de Guatemala'),
('2002', 'Mixco'),
('3003', 'Villa Nueva'),
('4004', 'Quetzaltenango'),
('5005', 'Escuintla'),
('6006', 'Antigua Guatemala'),
('7007', 'Cobán'),
('8008', 'Chiquimula'),
('9009', 'Puerto Barrios'),
('10010', 'Jalapa'),
('11011', 'Jutiapa'),
('12012', 'Zacapa'),
('13013', 'Huehuetenango'),
('14014', 'San Marcos'),
('15015', 'Totonicapán');


INSERT INTO camiones (placa, modelo, tipo)
VALUES ('P123ABC', 'Volvo FH', 'Trailer'),
('P234BCD', 'Scania R450', 'Camión rígido'),
('P345CDE', 'Mercedes Actros', 'Camión articulado'),
('P456DEF', 'MAN TGX', 'Camión rígido'),
('P567EFG', 'Iveco Stralis', 'Trailer'),
('P678FGH', 'DAF XF', 'Camión articulado'),
('P789GHI', 'Renault Magnum', 'Camión rígido'),
('P890HIJ', 'Kenworth T680', 'Trailer'),
('P901IJK', 'Peterbilt 579', 'Camión articulado'),
('P012JKL', 'Freightliner Cascadia', 'Camión rígido'),
('P123KLM', 'Mack Anthem', 'Trailer'),
('P234LMN', 'Western Star 5700', 'Camión articulado'),
('P345MNO', 'Hino 700', 'Camión rígido'),
('P456NOP', 'Isuzu Giga', 'Trailer'),
('P567OPQ', 'Fuso Super Great', 'Camión articulado');


ALTER TABLE camiones
ALTER COLUMN tipo TYPE VARCHAR(30);

ALTER TABLE camiones
ALTER COLUMN modelo TYPE VARCHAR(30);


INSERT INTO conduce_camionero (fecha_conduccion, dpi_camionero, placa_camion)
VALUES ('15/01/2025', 1234567890123, 'P123ABC'),
('16/01/2025', 2345678901234, 'P234BCD'),
('17/01/2025', 3456789012345, 'P345CDE'),
('18/01/2025', 4567890123456, 'P456DEF'),
('19/01/2025', 5678901234567, 'P567EFG'),
('20/01/2025', 6789012345678, 'P678FGH'),
('21/01/2025', 7890123456789, 'P789GHI'),
('22/01/2025', 8901234567890, 'P890HIJ'),
('23/01/2025', 9012345678901, 'P901IJK'),
('24/01/2025', 1123456789012, 'P012JKL'),
('25/01/2025', 2234567890123, 'P123KLM'),
('26/01/2025', 3345678901234, 'P234LMN'),
('27/01/2025', 4456789012345, 'P345MNO'),
('28/01/2025', 5567890123456, 'P456NOP'),
('29/01/2025', 667890123456, NULL);

SET datestyle = 'ISO', 'DMY';

ALTER TABLE conduce_camionero
DROP CONSTRAINT conduce_camionero_pkey;

ALTER TABLE conduce_camionero
ADD PRIMARY KEY (fecha_conduccion, dpi_camionero);

ALTER TABLE conduce_camionero
DROP CONSTRAINT conduce_camionero_placa_camion_fkey;

-- 1. Eliminar la PK actual (copia el nombre exacto que muestra DataGrip)
ALTER TABLE conduce_camionero
DROP CONSTRAINT conduce_camionero_pkey;

-- 2. Crear nueva PK solo con (fecha_conduccion, dpi_camionero)
ALTER TABLE conduce_camionero
ADD PRIMARY KEY (fecha_conduccion, dpi_camionero);

-- 3. Permitir NULLs en placa_camion (si no se hizo automáticamente)
ALTER TABLE conduce_camionero
ALTER COLUMN placa_camion DROP NOT NULL;

-- insertar DPI null en la tabla camioneros para que pueda ser insertado el valor en la tabla conduce_camionero
INSERT INTO camioneros (dpi, nombre, telefono, direccion, salario)
VALUES (667890123456, null, null,null, null);
