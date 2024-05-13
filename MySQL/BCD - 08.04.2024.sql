create database vendas;

use vendas;

create table if not exists tbl_produtos (
 id int not null auto_increment,
 nome_prod varchar(50) not null,
 unidade varchar(20) not null,
 data_cad timestamp default current_timestamp,   /*vai pegar a data atual do sistema levando em conta nosso fuso horario*/
 primary key(id)
 );

create table if not exists tbl_valor_produtos (
 id int not null auto_increment,
 
 id_prod int not null,
 valor decimal(10,2) not null,
 data_cad timestamp default current_timestamp,
 primary key(id),
 constraint fk_tbl_produtos_tbl_valor_produtos foreign key (id_prod)
	references tbl_produtos(id)
 );

insert into tbl_produtos (nome_prod, unidade) values
('produto A', 'kilograma'),
('produto B', 'unidade'),
('produto C', 'litro'),
('produto D', 'kilograma');

insert into tbl_produtos (nome_prod, unidade) values
('produto E', 'kilograma');

drop table tbl_produtos;

insert into tbl_valor_produtos (id_prod, valor) values 
(1, 10.50),
(2, 15.75),
(3, 20.00);

insert into tbl_valor_produtos (id_prod, valor) values 
(1, 12.50),
(2, 13.00),
(3, 23.00),
(4, 16.00);

select * from tbl_produtos;

select * from tbl_valor_produtos;


select 
	 *
from
	tbl_produtos p
inner join  /*tras registros que tenham correspondencias nas duas tabelas*/
	tbl_valor_produtos vp on p.id = vp.id_prod;
	
select 
	p.nome_prod,
    vp.valor,
    p.unidade,
    p.data_cad
from
    tbl_produtos p
left outer join /*seleciona todos os registros independente dse tenham correspondencias ou não*/
	tbl_valor_produtos vp on p.id = vp.id_prod;  /* on - compara os campos */
    
select 
	p.nome_prod,
    vp.valor,
    p.unidade,
    p.data_cad
from
    tbl_produtos p
inner join 
	tbl_valor_produtos vp on p.id = vp.id_prod;

select 
	p.nome_prod,
    vp.valor,
    p.unidade,
    vp.data_cad
from
	tbl_produtos p
right outer join
	tbl_valor_produtos vp on p.id = vp.id_prod;


select 
	p.nome_prod,
    vp.valor,
    p.unidade,
    vp.data_cad
from
	tbl_produtos p
cross join  
	tbl_valor_produtos vp;


select *
from tbl_valor_produtos
where valor in(12.5, 20);

select *
from tbl_valor_produtos
where valor not in(20);


select * 
from tbl_produtos
where id in (select id_prod from tbl_valor_produtos where valor < 20);

select * 
from tbl_produtos
where id not in (select id_prod from tbl_valor_produtos where valor < 16);


select * 
from tbl_produtos p
where p.id > all (select id_prod from tbl_valor_produtos where valor < 18);

select * 
from tbl_produtos p
where p.id = any (select id_prod from tbl_valor_produtos where valor < 16);

select nome_prod 
from tbl_produtos p 
where exists (
	select *
    from tbl_valor_produtos vp
    where vp.id_prod = p.id and vp.valor < 20
);

/*retorna a data atual*/
select now();

select 
	p.nome_prod as produto,
    vp.valor as valor_unitario,
    vp.valor * 10 as preço_total
from
	tbl_produtos p
join 
	tbl_valor_produtos vp on p.id = vp.id_prod
where
	p.nome_prod = 'Produto A'
order by 
	vp.data_cad desc
limit 1;

/*Adição*/
select 100 + 50 as result;

/*Subtração*/
select 8 - 5  as result;

/*Adição e subtração*/
select 100 + 8 - 5  as result;

/*Multiplicação*/
select 8 * 5  as result;

/*Multiplicação com divisão*/
select (2 * 5 / 10)  as result;

/*Multiplicação com adição e divisão*/
select ((2 * 5) + 10 / 10)  as result;

/*Arredondando valores*/
select round(2 * 5 / 10)  as result;

/*update com operação aritmetica*/
update tbl_valor_produtos as vp
set
    vp.valor = vp.valor * 1.05
where id = 2;

select  date_sub(now(), interval 2 day);
select  date_sub(now(), interval 2 hour);
select  date_sub(now(), interval 2 year);
select  date_sub(now(), interval 2 minute);
select  date_sub(now(), interval 102 second);
select  date_sub('2024-04-10', interval 2 day);

select date_add(now(), interval 2 day);

/*retorna a data atual*/
select curdate();

/*retorna a hora atual*/
select curtime();

/*count: usadas para contar o numero de registros retornados por uma consulta*/
select count(*) as qtd_produtos from vendas.tbl_produtos;

/*sum: usada para calcular a soma de valores em uma coluna*/
select sum(valor) as qtd_produtos from vendas.tbl_valor_produtos;

/*avg: usada para calcular a média ded valores em uma coluna*/
select avg(valor) as qtd_produtos from vendas.tbl_valor_produtos;

/*max: usado para encontrar o valor maximo em uma coluna*/
select max(valor) as qtd_produtos from vendas.tbl_valor_produtos;


select max(valor) as valor from vendas.tbl_valor_produtos;
select max(id) as menor_id from vendas.tbl_valor_produtos;
select max(id) as menor_id from vendas.tbl_produtos;

/*max: usado para encontrar o valor minimo em uma coluna*/
select min(valor) as valor from vendas.tbl_valor_produtos;
select min(id) as menor_id from vendas.tbl_valor_produtos;
select min(id) as menor_id from vendas.tbl_produtos;

/*group by: usada para agrupar registros com base em valores semelhantes em uma ou mais colunas*/
select id_prod from vendas.tbl_valor_produtos group by id_prod;

select 
	id_prod
from
	vendas.tbl_valor_produtos
group by id_prod
order by id_prod desc;

/*usados para retornar valores distintos em uma coluna*/
select distinct(id_prod) from vendas.tbl_valor_produtos;

/*like: usado para realizar uma correspondencia de padroes em uma consulta, util para pesquisas */
select * from vendas.tbl_produtos where nome_prod like 'A%';
select * from vendas.tbl_produtos where nome_prod like '%Rr%';

/*limit: usado para restringir o numero de registros retornados por pesquisa*/
select * from vendas.tbl_produtos order by id limit 3;
select * from vendas.tbl_produtos order by nome_prod limit 2;
select * from vendas.tbl_produtos order by nome_prod desc limit 2;


/*arredondamento de numeros*/
select round(123.4545, 2), round(123.45, - 2);

/*raiz quadrada*/
select sqrt(9), sqrt(16);

/*retorna o maior inteiro menor ou igual a expressao numerica especificada*/
select floor(123.45), floor(-123.45), floor(12.99);

/*retorna o valor da expressao especificada para a potencia indicada*/
select power(2,3);

/*retorna o valor de pi*/
select pi();













