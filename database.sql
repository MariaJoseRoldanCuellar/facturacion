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
    fecha           date,
    id_cliente      int(11),
    id_producto     int(11),
    cantidad        varchar(100),
    valor_unitario  float(10,2),
    CONSTRAINT      pk_factura     PRIMARY KEY(id_factura),
    CONSTRAINT      fk_cliente     FOREIGN KEY(id_cliente) REFERENCES t_cliente(id_cliente),
    CONSTRAINT      fk_producto    FOREIGN KEY(id_producto) REFERENCES t_producto(id_producto)
)ENGINE=InnoDb;      

CREATE TABLE t_usuario(
    
)

SELECT pro.id_producto,
		pro.producto,
        pro.id_unidad,
        pro.valor_unitario,
        uni.unidad
FROM t_producto pro
INNER JOIN t_unidad uni ON pro.id_unidad = uni.id_unidad

