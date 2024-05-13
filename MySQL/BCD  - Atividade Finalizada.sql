create database loja;

use Loja;

create table tbl_clientes(
	id int not null auto_increment,
	nome varchar (45) not null,
	sobrenome varchar (45) not null,
	cpf varchar(15) not null,
	primary key(id)
);

select * from tbl_clientes; 

insert into tbl_clientes(nome, sobrenome, cpf)
values('Paula', 'Custódio Mattos', '199.535.473-27');

use Loja;

create table if not exists tbl_telefones (
	id int not null auto_increment,
	id_cliente int not null,
    telefone varchar(20) not null,
	primary key(id),
    foreign key (id_cliente) references tbl_clientes(id)
);

select * from tbl_telefones;

insert ignore into tbl_telefones(id_cliente, telefone) values
(5, '19-08540-4259'),
(4, '19-26629-1637'),
(4, '19-04200-6656'),
(6, '19-21656-6673'),
(2, '19-23779-0730'),
(10, '19-23800-1397'),
(1, '19-26713-0996'),
(5, '19-43807-6196'),
(2, '19-65099-7930'),
(8, '19-68006-4771'),
(3, '19-70369-6223'),
(7, '19-82890-0575'),
(9, '19-84570-8790');

use Loja;

create table if not exists tbl_entregadores (
	id int not null auto_increment,
	nome varchar (45) not null,
	sobrenome varchar (45) not null,
    veiculo varchar (45) not null,
	primary key(id)
);

insert into tbl_entregadores(nome, sobrenome, veiculo) values
('Pedro', 'Henrique', 'moto'),
('Thiago', 'Filho', 'moto'),
('Vitor', 'Hugo', 'moto'),
('Erivaldo', 'Souza', 'bicicleta');

select * from tbl_entregadores;

create table tbl_endereco(
	id int not null auto_increment,
    id_cliente int not null,
	cep varchar (15) not null,
	numero varchar (6) not null,
	complemento varchar(15) not null,
	primary key(id),
    foreign key (id_cliente) references tbl_clientes(id)
);

select * from tbl_endereco;

insert ignore into tbl_endereco(id_cliente, cep, numero, complemento) values
(6, '13170-409', 776,'fundos'),
(3, '13177-412', 249, 'AP14 BL24'),
(2, '13178-404', 93, ''),
(10, '13178-408', 488, ''),
(9, '13178-411', 47 , 'AP26 BL12'),
(1, '13178-414', 769, 'frente'),
(8, '13180-410', 886, 'fundos'),
(5, '13180-413', 536, 'AP44 BL10'),
(4, '13180-414', 140, ''),
(7, '13182-412', 400, 'Casa A');

create table if not exists tbl_produtos (
	id int not null auto_increment,
	nome_produto varchar (45) not null,
	preco_unitario decimal (4,2) not null,
	primary key(id)
);

select * from tbl_produtos;

insert ignore into tbl_produtos(nome_produto, preco_unitario) values
('Refrigerante - Lata', 6.00),
('X-Burguer', 15.00),
('X-Egg', 17.00),
('X-Frango', 20.00),
('X-Tudo', 22.00);

create table if not exists tbl_pedidos (
	id int not null auto_increment,
    id_cliente int not null,
	id_produto int not null,
    id_entregador int not null,
    hora_pedido time default '00:00:00',
    hora_entrega time default '00:00:00',
    hora_fim time default '00:00:00',
    data_entrega date,
	primary key(id),
    foreign key (id_cliente) references tbl_clientes(id),
    foreign key (id_entregador) references tbl_entregadores(id),
    foreign key (id_produto) references tbl_produtos(id)
);

select * from tbl_pedidos;

INSERT IGNORE INTO tbl_pedidos(id_cliente, id_produto, id_entregador, hora_pedido, hora_entrega, hora_fim, data_entrega) VALUES
(4, 4, 1, '17:30:00', '18:03:00', '', '2023-12-01'),
(10, 1, 1, '17:30:00', '19:03:00','', '2023-12-02'),
(3, 3, 2, '17:30:00', '20:03:00','', '2023-12-03'),
(2, 7, 2, '17:30:00', '21:03:00','', '2023-12-04'),
(10, 2, 1, '17:30:00', '18:03:00','', '2023-12-05'),
(6, 5, 1, '17:30:00', '19:03:00','', '2023-12-06'),
(4, 2, 1, '17:30:00', '20:03:00','', '2023-12-07'),
(9, 4, 1, '17:30:00', '21:03:00','', '2023-12-08'),
(3, 6, 1, '17:30:00', '18:03:00','', '2023-12-09'),
(4, 2, 1, '17:30:00', '19:03:00','', '2023-12-10'),
(5, 6, 1, '17:30:00', '20:03:00','', '2023-12-11'),
(2, 4, 1, '17:30:00', '21:03:00','', '2023-12-12'),
(10, 1, 2, '17:30:00', '18:03:00','', '2023-12-13'),
(5, 1, 2, '17:30:00', '19:03:00','', '2023-12-14'),
(3, 6, 2, '17:30:00', '22:30:00','', '2023-12-15'),
(10, 1, 2, '17:30:00', '21:03:00','', '2023-12-16'),
(3, 1, 2, '17:30:00', '18:03:00','', '2023-12-17'),
(5, 3, 2, '17:30:00', '19:03:00','', '2023-12-18'),
(8, 7, 2, '17:30:00', '20:03:00','', '2023-12-19'),
(3, 5, 3, '17:30:00', '21:03:00','', '2023-12-20'),
(2, 3, 3, '17:30:00', '18:03:00','', '2023-12-21'),
(5, 5, 3, '17:30:00', '19:03:00','', '2023-12-22'),
(1, 2, 3, '17:30:00', '23:03:00','', '2023-12-23'),
(10, 1, 3, '17:30:00', '21:03:00','', '2023-12-24'),
(7, 5, 3, '17:30:00', '18:03:00','', '2023-12-25'),
(3, 5, 3, '17:30:00', '18:55:00','', '2023-12-26'),
(4, 6, 4, '17:30:00', '19:03:00','', '2023-12-27'),
(4, 3, 4, '17:30:00', '20:03:00','', '2023-12-28'),
(2, 2, 4, '17:30:00', '22:05:00','', '2023-12-29');

select * 
from tbl_pedidos
where id_cliente = 4
order by data_entrega desc;

delete from tbl_pedidos where id=26;

select * 
from tbl_pedidos
where id_cliente = 1
order by data_entrega desc;

delete from tbl_pedidos where id=21;

use loja;

update tbl_pedidos set hora_fim = '23:45';


