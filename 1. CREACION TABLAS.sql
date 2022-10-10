-- Grupo 3 Creación de tablas

/*1*/	IF OBJECT_ID('grupo3.RESERVA') IS NOT NULL DROP TABLE grupo3.RESERVA
go
/*2*/	IF OBJECT_ID('grupo3.SATISFACCION') IS NOT NULL DROP TABLE grupo3.SATISFACCION
go
/*3*/	IF OBJECT_ID('grupo3.HABITACION') IS NOT NULL DROP TABLE grupo3.HABITACION
go
/*4*/	IF OBJECT_ID('grupo3.TIPO_HABITACION') IS NOT NULL DROP TABLE grupo3.TIPO_HABITACION
go
/*5*/	IF OBJECT_ID('grupo3.HUESPED') IS NOT NULL DROP TABLE grupo3.HUESPED
go



create table grupo3.HUESPED
(
huesped_id       int    not null,
nombre           nvarchar(50)    not null,
apellido         nvarchar(50)    not null,
dni              nvarchar(8) not null ,
telefono         nvarchar(50)    not null,
pais			 nvarchar(50)    not null
)
go

create table grupo3.HABITACION
(
habitacion_id       int    not null,
tipo_habitacion_id	int    not null,
numero				nvarchar(3)    not null,
piso				nvarchar(2)    not null
)
go

create table grupo3.RESERVA
(
reserva_id				int    not null,
fecha_checking          datetime    not null,
fecha_checkout			datetime   not null,
habitacion_id			int    not null,
huesped_id				int    not null,
satisfaccion_id			int    not null
)
go

create table grupo3.SATISFACCION
(
satisfaccion_id     int    not null,
nivel_satisfaccion	nvarchar(50)    not null
)
go

create table grupo3.TIPO_HABITACION
(
tipo_habitacion_id       int    not null,
nombre_tipo				 nvarchar(50) not null,
precio_diario			 int not null
)
go


alter table grupo3.HUESPED add constraint pk_grupo3_huesped_id primary key (huesped_id)
go
alter table grupo3.HABITACION add constraint pk_grupo3_habitacion_id primary key (habitacion_id)
go
alter table grupo3.RESERVA add constraint pk_grupo3_reserva_id primary key (reserva_id)
go
alter table grupo3.SATISFACCION add constraint pk_grupo3_satisfaccion_id primary key (satisfaccion_id)
go
alter table grupo3.TIPO_HABITACION add constraint pk_grupo3_tipo_habitacion_id primary key (tipo_habitacion_id)
go


ALTER TABLE grupo3.HABITACION ADD CONSTRAINT fk_tipo_habitacion_id FOREIGN KEY (tipo_habitacion_id) REFERENCES grupo3.TIPO_HABITACION (tipo_habitacion_id)
go
ALTER TABLE grupo3.RESERVA ADD CONSTRAINT fk_habitacion_id FOREIGN KEY (habitacion_id) REFERENCES grupo3.HABITACION (habitacion_id)
go
ALTER TABLE grupo3.RESERVA ADD CONSTRAINT fk_huesped_id FOREIGN KEY (huesped_id) REFERENCES grupo3.HUESPED (huesped_id)
go
ALTER TABLE grupo3.RESERVA ADD CONSTRAINT fk_satisfaccion_id FOREIGN KEY (satisfaccion_id) REFERENCES grupo3.SATISFACCION (satisfaccion_id)
go
