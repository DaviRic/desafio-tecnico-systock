-- 1.1 - Consumo por produto e mês
select produto_id, sum(qtde_vendida) as total_consumo
from venda
where
	data_emissao between '2025-02-01' and '2025-02-28'
group by
	produto_id;
