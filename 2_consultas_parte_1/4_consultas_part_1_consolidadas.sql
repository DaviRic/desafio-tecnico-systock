-- 1.1 - Consumo por produto e mês
select produto_id, sum(qtde_vendida) as total_consumo
from venda
where
	data_emissao between '2025-02-01' and '2025-02-28'
group by
	produto_id;


-- 1.2 – Produtos com requisição pendente
select pc.produto_id
from pedido_compra pc
	left join entradas_mercadoria em
		on pc.ordem_compra = em.ordem_compra
where
	em.ordem_compra is null;


-- 1.3 - Produtos não consumidos e não recebidos
select distinct pc.produto_id
from pedido_compra pc
left join venda v
	on pc.produto_id = v.produto_id
		and v.data_emissao between '2025-02-01' and '2025-02-28'
left join 
	entradas_mercadoria em
	on pc.ordem_compra = em.ordem_compra
where
	v.produto_id is null
	and em.ordem_compra is null
	and pc.data_pedido between '2025-02-01' and '2025-02-28';
