create table tb_usuarios
(
    id_usuario            int auto_increment
        primary key,
    nombre                varchar(150)   null,
    apellidos             varchar(150)   null,
    username              varchar(50)    null,
    pass                  varchar(50)    null,
    horas_acumuladas      decimal(5, 2)  null,
    minutos_gratis_semana int default 60 null,
    rol                   varchar(50)    null,
    ultima_actualizacion  date           null
);

create table registro_agua
(
    id_registro        int auto_increment
        primary key,
    id_usuario         int  null,
    fecha              date null,
    hora_inicio        time null,
    hora_fin           time null,
    minutos_utilizados int  null,
    constraint registro_agua_ibfk_1
        foreign key (id_usuario) references tb_usuarios (id_usuario)
);

create index id_usuario
    on registro_agua (id_usuario);


