-- Parte 2
-- Transformação dos dados
select
	pc.produto_id || ' - ' || pc.descricao_produto as Produto,
	sum(pc.qtde_pedida) as qtde_requisitada,
	TO_CHAR(pc.data_pedido, "DD/MM/YYYY")
from pedido_compra pc
group by
	pc.produto_id, pc.descricao_produto, pc.data_pedido
having
	sum(pc.qtde_pedida) > 10;
