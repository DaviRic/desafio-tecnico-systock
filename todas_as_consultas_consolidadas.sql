-- Este arquivo .sql possui todas as consultas do case consolidadas,
-- tanto a parte 1 (Consultas SQL Básicas), quanto a parte 2 (Transformação de Dados)

-- Cria o banco de dados Systock
create database systock;

-- Tabela de vendas
CREATE TABLE public.venda(
	venda_id int8 NOT NULL,
	data_emissao date NOT NULL,
	horariomov varchar(8) DEFAULT '00:00:00'::character varying NOT NULL,
	produto_id varchar(25) DEFAULT ''::character varying NOT NULL,
	qtde_vendida float8 NULL,
	valor_unitario numeric(12, 4) DEFAULT 0 NOT NULL,
	filial_id int8 DEFAULT 1 NOT NULL,
	item int4 DEFAULT 0 NOT NULL,
	unidade_medida varchar(3) NULL,
	CONSTRAINT pk_consumo PRIMARY KEY (filial_id, venda_id, data_emissao, produto_id, item, horariomov)
)

-- Tabela de pedidos de compra
CREATE TABLE public.pedido_compra(
	pedido_id float8 DEFAULT 0 NOT NULL,
	data_pedido date NULL,
	item float8 DEFAULT 0 NOT NULL,
	produto_id varchar(25) DEFAULT '0' NOT NULL,
	descricao_produto varchar(255) NULL,
	ordem_compra float8 DEFAULT 0 NOT NULL,
	qtde_pedida float8 NULL,
	filial_id int4 NULL,
	data_entrega date NULL,
	qtde_entregue float8 DEFAULT 0 NOT NULL,
	qtde_pendente float8 DEFAULT 0 NOT NULL,
	preco_compra float8 DEFAULT 0 NULL,
	fornecedor_id int4 DEFAULT 0 NULL,
	CONSTRAINT pedido_compra_pkey PRIMARY KEY (pedido_id , produto_id, item)
);

-- Tabela de entradas de mercadoria
CREATE TABLE public.entradas_mercadoria (
	ordem_compra float8 DEFAULT 0 NOT NULL,
	data_entrada date NULL,
	nro_nfe varchar(255) NOT NULL,
	item float8 DEFAULT 0 NOT NULL,
	produto_id varchar(25) DEFAULT '0' NOT NULL,
	descricao_produto varchar(255) NULL,
	qtde_recebida float8 NULL,
	filial_id int4 NULL,
	custo_unitario numeric(12, 4) DEFAULT 0 NOT NULL,
	CONSTRAINT entradas_mercadoria_pkey PRIMARY KEY (ordem_compra, item, produto_id, nro_nfe)
);

-- Populando tabelas
INSERT INTO public.venda (venda_id, data_emissao, horariomov, produto_id, qtde_vendida, valor_unitario, filial_id, item, unidade_medida)
VALUES
(1, '2025-02-05', '10:00:00', '1001', 5, 10.00, 1, 1, 'UN'),
(2, '2025-02-10', '11:30:00', '1002', 2, 15.50, 1, 1, 'UN'),
(3, '2025-02-15', '09:45:00', '1003', 8, 20.00, 1, 1, 'CX'),
(4, '2025-02-20', '14:20:00', '1001', 3, 10.00, 1, 2, 'UN');

-- Populando a tabela de pedido_compra
INSERT INTO public.pedido_compra (pedido_id, data_pedido, item, produto_id, descricao_produto, ordem_compra, qtde_pedida, filial_id, data_entrega, qtde_entregue, qtde_pendente, preco_compra, fornecedor_id)
VALUES
(101, '2025-02-01', 1, '1001', 'Detergente', 501, 20, 1, '2025-02-05', 20, 0, 8.00, 300),
(102, '2025-02-03', 1, '1002', 'Sabonete', 502, 15, 1, '2025-02-07', 10, 5, 5.50, 301),
(103, '2025-02-07', 1, '1003', 'Papel A4', 503, 30, 1, '2025-02-10', 0, 30, 12.00, 302),
(104, '2025-02-10', 1, '1004', 'Álcool Gel', 504, 5, 1, NULL, 0, 5, 18.00, 303),
(105, '2025-02-15', 1, '1005', 'Esponja', 0, 12, 1, NULL, 0, 12, 2.50, 300); -- Ordem_compra = 0 -> não recebido

-- Populando a tabela de entradas_mercadoria
INSERT INTO public.entradas_mercadoria (ordem_compra, data_entrada, nro_nfe, item, produto_id, descricao_produto, qtde_recebida, filial_id, custo_unitario)
VALUES
(501, '2025-02-05', 'NFE001', 1, '1001', 'Detergente', 20, 1, 8.00),
(502, '2025-02-07', 'NFE002', 1, '1002', 'Sabonete', 10, 1, 5.50),
(503, NULL, 'NFE003', 1, '1003', 'Papel A4', 0, 1, 12.00);


-- Parte 1
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


-- Parte 2
-- Transformação de dados
select
	pc.produto_id || ' - ' || pc.descricao_produto as Produto,
	sum(pc.qtde_pedida) as qtde_requisitada,
	TO_CHAR(pc.data_pedido, "DD/MM/YYYY")
from pedido_compra pc
group by
	pc.produto_id, pc.descricao_produto, pc.data_pedido
having
	sum(pc.qtde_pedida) > 10;
