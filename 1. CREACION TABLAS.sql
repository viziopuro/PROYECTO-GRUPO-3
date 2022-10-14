-- Grupo 3 Creación de tablas

/*1*/	IF OBJECT_ID('RESERVA') IS NOT NULL DROP TABLE RESERVA
go
/*2*/	IF OBJECT_ID('SATISFACCION') IS NOT NULL DROP TABLE SATISFACCION
go
/*3*/	IF OBJECT_ID('HABITACION') IS NOT NULL DROP TABLE HABITACION
go
/*4*/	IF OBJECT_ID('TIPO_HABITACION') IS NOT NULL DROP TABLE TIPO_HABITACION
go
/*5*/	IF OBJECT_ID('HUESPED') IS NOT NULL DROP TABLE HUESPED
go



create table HUESPED
(
huesped_id       int    not null,
nombre           nvarchar(50)    not null,
apellido         nvarchar(50)    not null,
dni              nvarchar(8) not null ,
telefono         nvarchar(50)    not null,
pais			 nvarchar(50)    not null
)
go

create table HABITACION
(
habitacion_id       int    not null,
tipo_habitacion_id	int    not null,
numero				nvarchar(3)    not null,
piso				nvarchar(2)    not null
)
go

create table RESERVA
(
reserva_id				int    not null,
fecha_checking          datetime    not null,
fecha_checkout			datetime   not null,
habitacion_id			int    not null,
huesped_id				int    not null,
satisfaccion_id			int    not null
)
go

create table SATISFACCION
(
satisfaccion_id     int    not null,
nivel_satisfaccion	nvarchar(50)    not null,
fecha_llenado		datetime not null,
huesped_id          int    not null
)
go

create table TIPO_HABITACION
(
tipo_habitacion_id       int    not null,
nombre_tipo				 nvarchar(50) not null,
precio_diario			 int not null
)
go


alter table HUESPED add constraint pk_huesped_id primary key (huesped_id)
go
alter table HABITACION add constraint pk_habitacion_id primary key (habitacion_id)
go
alter table RESERVA add constraint pk_reserva_id primary key (reserva_id)
go
alter table SATISFACCION add constraint pk_satisfaccion_id primary key (satisfaccion_id)
go
alter table TIPO_HABITACION add constraint pk_tipo_habitacion_id primary key (tipo_habitacion_id)
go


ALTER TABLE HABITACION ADD CONSTRAINT fk_tipo_habitacion_id FOREIGN KEY (tipo_habitacion_id) REFERENCES TIPO_HABITACION (tipo_habitacion_id)
go
ALTER TABLE RESERVA ADD CONSTRAINT fk_habitacion_id FOREIGN KEY (habitacion_id) REFERENCES HABITACION (habitacion_id)
go
ALTER TABLE RESERVA ADD CONSTRAINT fk_huesped_id FOREIGN KEY (huesped_id) REFERENCES HUESPED (huesped_id)
go
ALTER TABLE RESERVA ADD CONSTRAINT fk_satisfaccion_id FOREIGN KEY (satisfaccion_id) REFERENCES SATISFACCION (satisfaccion_id)
go


ALTER TABLE SATISFACCION ADD CONSTRAINT fk_huesped_id_2 FOREIGN KEY (huesped_id) REFERENCES HUESPED (huesped_id)
go

