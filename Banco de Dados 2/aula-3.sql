-- left join
select * from classificacao c
left join produto p ON c.CODIGO = p.CODIGO_CLASSIFICACAO 
where p.CODIGO_CLASSIFICACAO is null 

-- inner join
select * from classificacao c
join produto p ON c.CODIGO = p.CODIGO_CLASSIFICACAO 
where p.CODIGO_CLASSIFICACAO is null 

-- ex 1
select * from cliente c
left join vendas v on v.codcliente = c.codcliente

-- month
select *, month(v.datavenda) from cliente c
inner join vendas v on v.codcliente = c.codcliente and v.codvendedor = 5

-- case
select *,
case
	when v.codvenda = 3 then 'vendido'
	else 'nao vendido'
end
from cliente c 
inner join vendas v on v.codcliente = c.codcliente and v.codvendedor = 5
where v.datavenda >= '2023-02-01' and v.datavenda <= '2023-05-10'

-- ex 2
select * from cliente c
left join vendas v on v.codcliente = c.codcliente
left join cidades c2 on c2.codcidade = c.codcidade

-- ex 3
select * from itens_venda iv
left join vendas v on v.codvenda = iv.codvenda 