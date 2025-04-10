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


