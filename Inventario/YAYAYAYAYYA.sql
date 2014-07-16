/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     7/12/2014 4:22:31 AM                         */
/*==============================================================*/


drop table if exists CARGO;

drop table if exists CATEGORIA;

drop table if exists CLIENTE;

drop table if exists ESTADO;

drop table if exists FUNCIONARIO;

drop table if exists INVENTARIO;

drop table if exists PERSONA;

drop table if exists PRODUCTO;

drop table if exists SALIDA_PRODUCTO;

drop table if exists USUARIO;

/*==============================================================*/
/* Table: CARGO                                                 */
/*==============================================================*/
create table CARGO
(
   ID_CARGO             int not null auto_increment,
   ID_PROVEEDOR         int not null,
   ID_ESTADO            int not null,
   CARGO                varchar(140),
   primary key (ID_CARGO)
);

/*==============================================================*/
/* Table: CATEGORIA                                             */
/*==============================================================*/
create table CATEGORIA
(
   ID_CATEGORIA         int not null auto_increment,
   ID_ESTADO            int not null,
   CATEGORIA            varchar(30),
   DETALLE_CATEGORIA    varchar(140),
   primary key (ID_CATEGORIA)
);

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE
(
   ID_CLIENTE           int not null auto_increment,
   ID_PERSONA           int not null,
   primary key (ID_CLIENTE)
);

/*==============================================================*/
/* Table: ESTADO                                                */
/*==============================================================*/
create table ESTADO
(
   ID_ESTADO            int not null auto_increment,
   ESTADO               varchar(40),
   primary key (ID_ESTADO)
);

/*==============================================================*/
/* Table: FUNCIONARIO                                           */
/*==============================================================*/
create table FUNCIONARIO
(
   ID_PROVEEDOR         int not null auto_increment,
   ID_ESTADO            int not null,
   ID_PERSONA           int not null,
   primary key (ID_PROVEEDOR)
);

/*==============================================================*/
/* Table: INVENTARIO                                            */
/*==============================================================*/
create table INVENTARIO
(
   ID_INVENTARIO        int not null auto_increment,
   CANTIDAD_STOCK       int,
   FECHA_INV            date,
   primary key (ID_INVENTARIO)
);

/*==============================================================*/
/* Table: PERSONA                                               */
/*==============================================================*/
create table PERSONA
(
   ID_PERSONA           int not null auto_increment,
   ID_ESTADO            int not null,
   NOMBRE               varchar(140) DEFAULT 'VVV',
   APELLIDOS            varchar(140),
   TELEFONO             varchar(140),
   DIRECCION            varchar(140),

   primary key (ID_PERSONA)
);

/*==============================================================*/
/* Table: PRODUCTO                                              */
/*==============================================================*/
create table PRODUCTO
(
   ID_PRODUCTO          int not null auto_increment,
   ID_CATEGORIA         int not null,
   ID_INVENTARIO        int not null,
   ID_ESTADO            int not null,
   PRODUCTO             varchar(40),
   CANTIDAD             int,
   OBSERVACION          varchar(140),
   FECHA_INGRESO        date,
   FECHA_MODIFICACION   date,
   primary key (ID_PRODUCTO)
);

/*==============================================================*/
/* Table: SALIDA_PRODUCTO                                       */
/*==============================================================*/
create table SALIDA_PRODUCTO
(
   ID_SALIDA            int not null auto_increment,
   ID_PROVEEDOR         int not null,
   ID_PRODUCTO          int not null,
   ID_CLIENTE           int not null,
   FECHA                datetime,
   primary key (ID_SALIDA)
);

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
create table USUARIO
(
   ID_USUARIO           int not null auto_increment,
   ID_ESTADO            int not null,
   ID_PERSONA           int not null,
   USUARIO              varchar(140),
   PASSWORD             varchar(140),
   ROL                  varchar(140),
   primary key (ID_USUARIO)
);

alter table CARGO add constraint FK_RELATIONSHIP_16 foreign key (ID_PROVEEDOR)
      references FUNCIONARIO (ID_PROVEEDOR) on delete restrict on update restrict;

alter table CARGO add constraint FK_RELATIONSHIP_17 foreign key (ID_ESTADO)
      references ESTADO (ID_ESTADO) on delete restrict on update restrict;

alter table CATEGORIA add constraint FK_RELATIONSHIP_6 foreign key (ID_ESTADO)
      references ESTADO (ID_ESTADO) on delete restrict on update restrict;

alter table CLIENTE add constraint FK_RELATIONSHIP_8 foreign key (ID_PERSONA)
      references PERSONA (ID_PERSONA) on delete restrict on update restrict;

alter table FUNCIONARIO add constraint FK_RELATIONSHIP_4 foreign key (ID_ESTADO)
      references ESTADO (ID_ESTADO) on delete restrict on update restrict;

alter table FUNCIONARIO add constraint FK_RELATIONSHIP_7 foreign key (ID_PERSONA)
      references PERSONA (ID_PERSONA) on delete restrict on update restrict;

alter table PERSONA add constraint FK_RELATIONSHIP_15 foreign key (ID_ESTADO)
      references ESTADO (ID_ESTADO) on delete restrict on update restrict;

alter table PRODUCTO add constraint FK_RELATIONSHIP_10 foreign key (ID_INVENTARIO)
      references INVENTARIO (ID_INVENTARIO) on delete restrict on update restrict;

alter table PRODUCTO add constraint FK_RELATIONSHIP_3 foreign key (ID_ESTADO)
      references ESTADO (ID_ESTADO) on delete restrict on update restrict;

alter table PRODUCTO add constraint FK_TIENE foreign key (ID_CATEGORIA)
      references CATEGORIA (ID_CATEGORIA) on delete restrict on update restrict;

alter table SALIDA_PRODUCTO add constraint FK_RELATIONSHIP_11 foreign key (ID_PROVEEDOR)
      references FUNCIONARIO (ID_PROVEEDOR) on delete restrict on update restrict;

alter table SALIDA_PRODUCTO add constraint FK_RELATIONSHIP_12 foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE) on delete restrict on update restrict;

alter table SALIDA_PRODUCTO add constraint FK_RELATIONSHIP_9 foreign key (ID_PRODUCTO)
      references PRODUCTO (ID_PRODUCTO) on delete restrict on update restrict;

alter table USUARIO add constraint FK_RELATIONSHIP_13 foreign key (ID_PERSONA)
      references PERSONA (ID_PERSONA) on delete restrict on update restrict;

alter table USUARIO add constraint FK_RELATIONSHIP_14 foreign key (ID_ESTADO)
      references ESTADO (ID_ESTADO) on delete restrict on update restrict;

