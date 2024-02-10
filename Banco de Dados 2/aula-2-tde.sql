select (p.QUANTIDADE * p.VALOR) as total,
p.*
from produto p 
where p.TIPO = 'P' && p.QUANTIDADE * p.VALOR = (select max(p2.quantidade * p2.valor)
from produto p2 where p2.tipo='p'
order by 1 desc)

--ex11, resolução prof
select
	max(p.QUANTIDADE * p.VALOR),
	p.DESCRICAO,
	p.QUANTIDADE,
	p.VALOR,
	p.QUANTIDADE * p.VALOR
from
	produto p
where
	p.TIPO = 'p'
group by p.CODIGO
having sum(p.VALOR * p.QUANTIDADE) = (select max(p2.QUANTIDADE * p2.VALOR) from produto p2
where p2.tipo = 'p')