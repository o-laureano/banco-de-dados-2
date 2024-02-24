select * from produto p;

select * from classificacao c;

--ex1, minha
select * from produto p where UNIDADE != "UN" && CODIGO_CLASSIFICACAO = 003;
--resolução prof
select * from produto p
where p.CODIGO_CLASSIFICACAO = '003' and p.UNIDADE <> 'UN'


--ex2, minha
select * from produto p where UNIDADE = "UN" && CODIGO_CLASSIFICACAO = 003 && (QUANTIDADE >=5 && QUANTIDADE <= 7) && VALOR < 10;
--resolução prof
select * from produto p
where p.CODIGO_CLASSIFICACAO = 003 and UNIDADE = "UN" and p.QUANTIDADE >= 5 and p.QUANTIDADE <= 7 && p.VALOR < 10;
--comparando com texto --
select * from produto p
inner join classificacao c on c.CODIGO = p.CODIGO_CLASSIFICACAO 
where c.DESCRICAO like "%alimen%" and p.UNIDADE <> "UN"


--ex3
select sum(p.QUANTIDADE * p.VALOR) from produto p
where p.DESCRICAO like "%biscoito%"

--ex4
select * from produto p
inner join classificacao c on c.CODIGO = p.CODIGO_CLASSIFICACAO
where c.DESCRICAO not like "%constru%" && p.DESCRICAO like "%martelo%"