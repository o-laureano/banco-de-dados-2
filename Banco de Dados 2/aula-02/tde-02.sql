show tables

use henriquelaureano

-- 1) retornar os produtos da Classificação 003 e que a unidade de medida não  seja 'UN'
-- R: 139 registros;
select * from produto p where codigo_classificacao = '003' and unidade != 'UN'



-- 2) Retornar os produtos da Classificação 003, com a unidade de medida 'UN' em que a quantidade seja entre 5 e 7 com o valor menor que 10;
-- R: 27 registros;
select * from produto where codigo_classificacao = '003' and unidade = 'UN' and (quantidade >= 5 and quantidade <= 7) and valor < 10;


-- 3) Valor total dos 'biscoito' da base de dados;
-- R: 3021;

select (sum(valor*quantidade)) from produto  where descricao like '%biscoito%'

-- 4) Validar se existe algum 'martelo' que não pertença a classificação material de Construção
select * from produto p inner join classificacao c on c.codigo = p.codigo_classificacao where p.descricao like '%martelo%' and c.descricao != 'Materiais de Construção';

-- 5) Retornar os produtos da classificação EPI que estejam em menos  de 5 caixas;
-- R: 2 registros;
select * from produto p inner join classificacao c on c.codigo = p.codigo_classificacao where p.unidade = 'CX' and p.quantidade < 5 and c.descricao like '%EPI%';

-- 6) Retornar os produtos da Classificação EPI que NÃO ESTEJA em  caixas e sua quantidade esteja em 10 e 50;
-- R: 9 registros
select * from produto p inner join classificacao c on c.codigo = p.codigo_classificacao where p.unidade <> 'CX' and p.quantidade >= 10 and p.quantidade <= 50 and c.descricao like '%EPI%';

-- 7) Retornar todos registros da classificação UNIFORMES com o nome 'camiseta e todos os produtos da classificação MATERIAL ESPORTIVO e com nome 'bola'
-- R: 11 registros;
select * from produto p inner join classificacao c on c.codigo = p.codigo_classificacao where (c.descricao like '%UNIFORMES%' and p.descricao like '%camiseta%' or c.descricao like '%MATERIAIS ESPORTIVO%' and p.descricao like '%bola%');

-- 8) Retornar a média do valor dos produtos que a quantidade esteja entre 2 e 4, com valor inferior a 50, que não seja material de construção e que não seja um 'copo';
-- R: 18.8688
select avg(valor) from produto p inner join classificacao c on c.codigo = p.codigo_classificacao where (p.quantidade >= 2 and p.quantidade <= 4) and p.valor < 50 and c.descricao not like '%CONSTRUÇÃO%' and p.descricao not like '%copo%'

-- 9) Retornar o quantidade total de pacotes ( PCT) dos produtos  alimenticios
-- R: 1165;
select sum(p.quantidade) from produto p inner join classificacao c on c.codigo = p.codigo_classificacao where p.unidade = 'PCT' and c.descricao like '%ALIMENTÍCIOS%'


-- 10) Retornar apenas o numero total de produtos cadastrados com  unidade pacote e que seja da classificação de alimentos
-- R: 23 produtos;
select count(*) from produto p inner join classificacao c on c.codigo = p.codigo_classificacao where p.unidade = 'PCT' and c.descricao like '%ALIMENTÍCIOS%'

-- 11) Retornar qual é o maior valor de um produto do estoque, este deve ser o produto que sua quantidade * valor seja o maior
-- R: 1134870;
select max(valor*quantidade) from produto p where (select max(valor*quantidade) from produto) and p.tipo='P'

-- 12) Retornar o menor valor de um produto que a quantidade seja maior que 0 e que a unidade seja ‘UN’ e classificação alimentos
-- R: 1;
select * from classificacao where descricao like '%alim%'

select min(p.valor) from produto p inner join classificacao c on c.codigo = p.codigo_classificacao where p.quantidade> 0 and c.descricao like '%alim%' and p.unidade = 'UN'

-- 13) Retornar é o valor total dos produtos da categoria ‘Material Hospitalares’ 
-- R: 406355;
select sum(valor*quantidade) from produto p inner join classificacao c on c.codigo = p.codigo_classificacao where c.descricao like '%hospitala%'

-- 14) Retornar TODOS os valores totais por categoria e ordenar por categoria
select c.descricao, sum(valor*quantidade) from produto p inner join classificacao c on c.codigo = p.codigo_classificacao group by c.descricao

-- 15) Retornar todos os tipos de ‘UNIDADE’ da classificação Veterinária
-- R: 12;
select distinct p.unidade, c.descricao as Categoria from produto p inner join classificacao c on c.codigo = p.codigo_classificacao where c.descricao like '%Vet%'

-- 16) Contar Quantos produtos são da categoria de Aviamentos por unidade. EX: (20 produtos - UN; 2 PRODUTOS - PCT)
select sum(p.quantidade) as Quantidade, c.descricao as Categoria, p.unidade as Tipo from produto p inner join classificacao c on c.codigo = p.codigo_classificacao where c.descricao like '%aviam%' group by p.unidade
