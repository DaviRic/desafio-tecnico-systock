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
