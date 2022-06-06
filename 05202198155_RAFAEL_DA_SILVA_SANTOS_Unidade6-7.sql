# Faculdade QI
# Aluno: Rafael da Silva Santos
# RA: 05202198155
# Polo: Rio Grande - RS
# Curso: Sistemas para Internet

/*A) Criar o banco de dados e as tabelas*/
CREATE DATABASE DBCOMMERCE;
USE DBCOMMERCE;

CREATE TABLE produto (
	cdProduto int not null,
    descricao varchar(80) not null,
    constraint pk_cdProduto_id primary key (cdProduto)
);

CREATE TABLE estoque (
	cdProduto int not null,
    qtdeMin int not null,
    qtdeMax int not null,
    qtdeAtual int not null,
	constraint pk_cdProduto_id primary key (cdProduto),
    constraint fk_produto foreign key(cdProduto) references produto(cdProduto)
);

CREATE TABLE cliente (
	id bigint not null AUTO_INCREMENT,
    nome varchar(40),
    celular varchar(11),
    CONSTRAINT pk_id_id primary key (id)
);

CREATE TABLE nota (
	id bigint not null AUTO_INCREMENT,
    nro varchar(10),
    idCliente bigint not null,
    dtVenda date not null,
    CONSTRAINT pk_id_id primary key (id),
    constraint fk_cliente foreign key(idCliente) references cliente(id)
);

CREATE TABLE itensNota (
	id bigint not null AUTO_INCREMENT,
    idNota bigint not null,
    cdProduto int not null,
    vlUnitario DECIMAL(10,2) not null,
    qtde DECIMAL(4,1) not null,
    CONSTRAINT pk_id_id primary key (id),
    constraint fk_nota foreign key(idNota) references nota(id),
    constraint fk_estoque foreign key(cdProduto) references estoque(cdProduto)
);

/*B) Inserir os seguintes dados (os valores estão separados por - e na mesma ordem dos campos descritos acima)*/

insert into produto values(10, 'celular xiaomi redmi note 9');
insert into produto values(20, 'Batedeira Planetária Mondial BP-03 com 12 Velocidades e 700W');
insert into produto values(30, 'Geladeira/Refrigerador Frost Free cor Inox 310L Electrolux 127V');
insert into produto values(40, 'Smart TV UHD 4K LED 50” LG');

select * from produto;

insert into estoque values(10,5,15,6);
insert into estoque values(20,3,8,7);
insert into estoque values(30,2,5,5);

select * from estoque;

insert into cliente values(1,'Maria da Silva','51984730344');
insert into cliente values(2,'Carlos da Silva Feijó','51984723379');
insert into cliente values(3,'Suani Mendez Gonzales','51965824402');

select * from cliente;

insert into nota values(1,'000358785',1,'2020-01-20');
insert into nota values(2,'000358343',1,'2020-04-11');
insert into nota values(3,'000333343',2,'2021-02-12');

select * from nota;

insert into itensNota values(1,1,10,1500.00,1);
insert into itensNota values(2,1,20,248.00,1);
insert into itensNota values(3,2,30,2112.00,1);
insert into itensNota values(4,3,20,220.00,2);

select * from itensNota;

/*C) Criar uma procedure para gravar os dados na tabela estoque, mas gravar 
somente se as qtdes min e máxima forem maiores que ZERO e a máxima tem 
que ser maior ou igual a mínima e a atual deve ser gravada com ZERO.
Colocar a chamada da procedure com um exemplo de dados para gravar 
o produto de código 40.*/

DELIMITER $$

CREATE PROCEDURE sp_gravaEstoque(in cdProduto int, in qtdeMin int, in qtdeMax int)
BEGIN
	IF qtdeMin > 0 AND qtdeMax > 0 AND qtdeMax >= qtdeMin THEN
		INSERT INTO estoque values(cdProduto, qtdeMin, qtdeMax, 0);
	ELSE
		SELECT "A GRAVAÇÃO NÃO FOI POSSÍVEL, VERIFIQUE OS DADOS E TENTE NOVAMENTE.";
	END IF;
END $$

DELIMITER ;

call sp_gravaEstoque(40, 10, 50);

select * from estoque;

/*D) Criar um procedimento para atualizar o preço(vlunitario) na tabela itensNota.
A procedure irá receber o nro da nota, para filtrar e o código do produto, mais o 
novo valor a ser atualizado na tabela. Colocar a chamada da procedure com um 
exemplo de dados para atualizar o valor para 150.00 dos itens da
nota de nro 000358343.*/

DELIMITER $$

CREATE PROCEDURE sp_atualizaItensNota(In nroNotaIn varchar(10), in cdProdutoIn INT, in vlUnitarioNovo DECIMAL(10,2))
BEGIN

    UPDATE itensNota, nota set itensNota.vlUnitario=vlUnitarioNovo where nota.id=itensNota.idNota and nota.nro=nroNotaIn and itensNota.cdProduto=cdProdutoIn;
    
END $$

DELIMITER ;



call sp_atualizaItensNota ('000358343', 30, 150.00);


select * from itensNota;


/*e) Criar uma função que retorno o total vendido de um cliente. A função irá

receber o idCliente e irá retornar o total vendido para ele*/

DELIMITER $$
create function fn_vendaCliente(vlIdCliente bigint)

returns decimal(10,2) deterministic

begin

declare v_retorno decimal(10,2);

select sum(vlUnitario * qtde) INTO v_retorno from nota n, itensNota it, cliente c where n.id=it.idNota and
c.id=n.idCliente and c.id=vlIdCliente;

return v_retorno ;
end $$

DELIMITER ;

select fn_vendaCliente(1);