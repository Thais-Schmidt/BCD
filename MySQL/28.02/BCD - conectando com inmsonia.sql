create database db_clientes;

use db_clientes;

create table clientes(
	id int not null auto_increment,
    nome varchar(45) not null,
    idade int not null,
    primary key (id)
);

insert into clientes(nome, idade) values ('Girafa Grande', '82');

select * from clientes;

