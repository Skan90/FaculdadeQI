/*<UNIDADE 4>


# Faculdade QI (Polo Rio Grande)
# Aluno: Rafael da Silva Santos
# RA: 05202198155
# Polo: Rio Grande - RS
# Curso: Sistemas para Internet

Imaginemos uma situação hipotética, 
onde tenho um relatório de vendas que levava 30 segundos para executar
e depois de um certo tempo passou a levar 5 minutos, pois o número de registros da tabela,
onde buscamos os dados aumentou em cem vezes.
Este relatório apresenta ordenado por data venda(da menor para a maior data),
o cliente, data da venda, valor da venda, faturado (sim ou não) e o nome do vendedor.
O único filtro aplicado para apresentar este relatório é a data da venda. 
O cliente passou a reclamar que o relatório está cada dia mais lento.
A tabela principal, 
onde estão quase todos os dados
chama-se VENDA e as colunas são: id, id_vendedor, dtHrVenda, valor, faturado.

Com base nesta descrição da situação hipotética,
qual seria o procedimento para melhorar a performance do relatório,
supondo que a rede já tenha sido avaliada e que o Banco de Dados esteja
com as estatísticas atualizadas. 

Descreva com detalhes o que deve ser feito e o comando 
que deve ser construídoe poste o arquivo!*/

/*Pequena database para teste e visualização da atividade da unidade 4.*/
CREATE DATABASE lojaUnid4;
USE lojaUnid4;
CREATE TABLE venda(
	id INT NOT NULL,
    id_vendedor INT NOT NULL,
    dtHrVenda DATE,
	valor FLOAT NOT NULL,
    faturado varchar(3) NOT NULL
);

insert into venda value(01, 01, '2022-05-17 00:00:00', 100, 'SIM');
insert into venda value(02, 02, '2022-05-17 00:00:00', 100, 'NÃO');
insert into venda value(02, 02, '2022-05-17 00:14:50', 100, 'SIM');
insert into venda value(02, 02, '2022-05-17 00:12:12', 100, 'NÃO');
insert into venda value(03, 03, '2022-05-17 00:14:50', 100, 'SIM');
insert into venda value(04, 02, '2022-05-17 00:12:12', 100, 'SIM');
insert into venda value(05, 01, '2022-05-17 00:12:12', 100, 'SIM');

/*Fim da criação e inserção de dados para exemplo.*/

/*O relatório em questão é gerado pelo seguinte comando DQL (Data Query Language):*/

SELECT dtHrVenda, id, valor, faturado, id_vendedor FROM VENDA order by dtHrVenda DESC;

/*A criação de indexes ajuda na melhora do tempo de consulta ao banco de dados,
porem a criação de indexes em bancos de dados muito extensos pode ser demorada 
e ocupar mais espaço no servidor, o que em larga escala significa mais dinheiro 
investido por espaço para alocar as mesmas, portanto, não é recomendado gerar 
muitas indexes. Pelo contrário, é necessário escolher informações relevantes
as consultas e rotinas da database em questão. 

Na atividade a 'query' em questão tem a necessidade de fazer a consulta retornando
a listagem com data em ordem de mais recente para a mais antiga, portanto,
faremos uma index na data da venda, representada por "dtHrVenda".
Tendo em mente que a criação de uma index pode diminuir a performance das
delacações de DML (Data Manipulation Language) INSERT, UPDATE e DELETE. 
Segue o comando para a criação da index:*/

CREATE INDEX idx_dtHrVenda on venda(dtHrVenda);

/*Com esta indexação teremos uma diminuição significativa na 'query' 
sendo executada (exemplo da 'query' com 'alias' abaixo) pelo cliente em questão no banco de dados.*/

SELECT dtHrVenda 'Data', id 'ID do Cliente', valor 'Valor', faturado 'Faturado', id_vendedor 'ID do Vendedor' FROM VENDA order by dtHrVenda DESC;

