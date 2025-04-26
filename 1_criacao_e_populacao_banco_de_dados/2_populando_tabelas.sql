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
(105, '2025-02-15', 1, '1005', 'Esponja', 0, 12, 1, NULL, 0, 12, 2.50, 300);

-- Populando a tabela de entradas_mercadoria
INSERT INTO public.entradas_mercadoria (ordem_compra, data_entrada, nro_nfe, item, produto_id, descricao_produto, qtde_recebida, filial_id, custo_unitario)
VALUES
(501, '2025-02-05', 'NFE001', 1, '1001', 'Detergente', 20, 1, 8.00),
(502, '2025-02-07', 'NFE002', 1, '1002', 'Sabonete', 10, 1, 5.50),
(503, NULL, 'NFE003', 1, '1003', 'Papel A4', 0, 1, 12.00);
