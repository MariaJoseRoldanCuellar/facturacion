CREATE DATABASE Facturacion; 

USE Facturacion;

CREATE TABLE t_ciudad(
    id_ciudad       int(11)         AUTO_INCREMENT  NOT NULL,
    ciudad          varchar(100),
    CONSTRAINT      pk_ciudad       PRIMARY KEY(id_ciudad)
)ENGINE=InnoDb;

INSERT INTO t_ciudad (id_ciudad, ciudad) VALUES (NULL,"Bogotá");
INSERT INTO t_ciudad (id_ciudad, ciudad) VALUES (NULL,"Ibagué");
INSERT INTO t_ciudad (id_ciudad, ciudad) VALUES (NULL,"Cartagena");

CREATE TABLE t_unidad(
    id_unidad       int(11)         AUTO_INCREMENT NOT NULL,
    unidad          varchar(50),
    CONSTRAINT      pk_unidad       PRIMARY KEY(id_unidad)
)ENGINE=InnoDb;
 
INSERT INTO t_unidad (id_unidad, unidad) VALUES (NULL, "UNIDAD");
INSERT INTO t_unidad (id_unidad, unidad) VALUES (NULL, "KILO");
INSERT INTO t_unidad (id_unidad, unidad) VALUES (NULL, "RESMA");

CREATE TABLE t_cliente(
    id_cliente      int(11)          AUTO_INCREMENT NOT NULL,
    nombre          varchar(100),
    direccion       varchar(100),
    id_ciudad       int(11),
    CONSTRAINT      pk_cliente      PRIMARY KEY(id_cliente),
    CONSTRAINT      fk_ciudad       FOREIGN KEY(id_ciudad) REFERENCES t_ciudad(id_ciudad)
)ENGINE=InnoDb;

CREATE TABLE t_producto(
    id_producto     int(11)         AUTO_INCREMENT NOT NULL,
    producto        varchar(100),
    id_unidad       int(11), 
    valor_unitario  float(10,2), 
    CONSTRAINT      pk_producto     PRIMARY KEY(id_producto),
    CONSTRAINT      fk_unidad       FOREIGN KEY(id_unidad) REFERENCES t_unidad(id_unidad)
)ENGINE=InnoDb;


CREATE TABLE t_factura(
    id_factura      int(11)        AUTO_INCREMENT NOT NULL,
    id_usuario      int(11 ) AUTO_INCREMENT NOT NULL,
    fecha           date,
    id_cliente      int(11),
    id_producto     int(11),
    cantidad        int(11),
    valor_unitario  float(10,2),
    CONSTRAINT      pk_factura     PRIMARY KEY(id_factura),
    CONSTRAINT      fk_usuario     FOREIGN KEY (id_usuario), REFERENCES t_usuario (id_usuario),
    CONSTRAINT      fk_cliente     FOREIGN KEY(id_cliente) REFERENCES t_cliente(id_cliente),
    CONSTRAINT      fk_producto    FOREIGN KEY(id_producto) REFERENCES t_producto(id_producto)
)ENGINE=InnoDb;

CREATE TABLE t_rol (
    id_rol          int(11) AUTO_INCREMENT NOT NULL  ,
    rol             varchar (100),
    CONSTRAINT pk_rol PRIMARY KEY (id_rol)
)ENGINE=InnoDb;

CREATE TABLE t_usuario(
    id_usuario      int(11) AUTO_INCREMENT NOT NULL
    nombre          varchar (100),
    apellido        varchar (100),
    correo          varchar (100),
    password        varchar (100),
    id_rol          int (11),
    CONSTRAINT pk_usuario PRIMARY KEY (id_usuario),
    CONSTRAINT fk_rol FOREIGN KEY (id_rol) REFERENCES t_rol (id_rol)
)ENGINE=InnoDb;

SELECT pro.id_producto,
		pro.producto,
        pro.id_unidad,
        pro.valor_unitario,
        uni.unidad
FROM t_producto pro
INNER JOIN t_unidad uni ON pro.id_unidad = uni.id_unidad

--Factura
SELECT FAC.id_factura,
       FAC.fecha,
       FAC.id_usuario,
       USU.nombre,
       USU.apellido,
       FAC.id_cliente,
      CLIE.nombre,
      CLIE.direccion,
      FAC.id_producto,
      PROD.producto,
      FAC.cantidad,
      FAC.valor_unitario,
      FAC.cantidad *  FAC.valor_unitario AS Total
FROM `t_factura`  FAC
INNER JOIN t_usuario USU ON USU.id_usuario = FAC.id_usuario
INNER JOIN t_cliente CLIE ON CLIE.id_cliente = FAC.id_cliente
INNER JOIN t_producto PROD ON PROD.id_producto = FAC.id_producto

