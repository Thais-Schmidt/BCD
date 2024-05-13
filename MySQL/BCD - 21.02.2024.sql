create table tbl_clientes (
id int not null auto_increment,
nome varchar (20),
sobrenome varchar (45),
sexo char not null,
peso double,
primary key (id)
);

use loja;

select * from tbl_clientes;
select * from tbl_telefones;

INSERT INTO TBL_CLIENTES(NOME, SOBRENOME, SEXO, PESO, DATA_NASC)
VALUES('Pedro', 'Almeida', 'M', 70, '1995-04-28');

INSERT INTO TBL_TELEFONES(ID_CLIENTE, NUMERO)
VALUES('17', '49028765123');

select nome as cliente, sexo from tbl_clientes;
select nome, sexo from tbl_clientes;

SELECT * 
FROM TBL_CLIENTES AS CLI
INNER JOIN TBL_TELEFONES AS TEL
ON CLI.ID=TEL.ID_CLIENTE;

select cli.nome, cli.sobrenome, cli.sexo, cli.peso, tel.NUMERO 
from tbl_clientes as cli
INNER JOIN TBL_TELEFONES AS TEL
ON CLI.ID=TEL.ID_CLIENTE;

SELECT CONCAT(CLI.NOME, ' ', CLI.SOBRENOME) AS NOME_COMPLETO, 
CLI.SEXO, CLI.PESO, TEL.NUMERO
FROM TBL_CLIENTES AS CLI
INNER JOIN TBL_TELEFONES AS TEL
ON CLI.ID=TEL.ID_CLIENTE;

SELECT CONCAT(CLI.NOME, ' ', CLI.SOBRENOME) AS NOME_COMPLETO,
CLI.SEXO, CLI.PESO,
GROUP_CONCAT(TEL.NUMERO) AS TELEFONES
FROM TBL_CLIENTES AS CLI
INNER JOIN TBL_TELEFONES AS TEL
ON CLI.ID=TEL.ID_CLIENTE
GROUP BY NOME, SOBRENOME, SEXO, PESO;

SELECT CLI.ID,
CLI.SEXO, CLI.PESO,
GROUP_CONCAT(TEL.NUMERO) AS TELEFONES
FROM TBL_CLIENTES AS CLI
INNER JOIN TBL_TELEFONES AS TEL
ON CLI.ID=TEL.ID_CLIENTE
WHERE CLI.ID in (15,16)
GROUP BY ID, NOME, SOBRENOME, SEXO, PESO;

UPDATE TBL_CLIENTES
SET NOME_CAMPO = 'NOVOVALOR'
WHERE ID_TABELA=VALOR_DO_ID;

UPDATE TBL_TELEFONES
SET 
	ID_CLIENTE = 10
WHERE
	ID = 20;

select * from tbl_telefones;

SELECT NOME, SEXO FROM TBL_CLIENTES
WHERE NOME LIKE '%A%';

select * from tbl_clientes;


drop database loja;

