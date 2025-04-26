-- 1.2 – Produtos com requisição pendente
select pc.produto_id
from pedido_compra pc
	left join entradas_mercadoria em
		on pc.ordem_compra = em.ordem_compra
where
	em.ordem_compra is null;
