# Desafio Técnico - Banco de Dados

## Sobre este repositório

Este repositório contém a resolução do desafio técnico envolvendo criação de banco de dados, inserção de dados fictícios e execução de consultas SQL.

- O arquivo `todas_as_consultas_consolidadas.sql` possui todas as etapas do desafio em um único lugar: criação do banco de dados, criação das tabelas, inserção dos dados e execução das consultas solicitadas nas partes 1 e 2.  
  Criei esse arquivo consolidado para facilitar a execução completa, caso ache mais prático.  
  Abaixo, explico a organização dos arquivos e pastas de forma separada:

---

## Estrutura de Pastas e Arquivos

### 1. Pasta: `1_criacao_e_populacao_banco_de_dados`
Contém os scripts para criação do banco de dados e inserção de dados fictícios:
- `1_criacao_banco_dados_e_tabelas.sql` -> Cria o banco de dados `systock` e as tabelas (`venda`, `pedido_compra` e `entradas_mercadoria`);
- `2_populando_tabelas.sql` -> Popula as tabelas com dados fictícios para permitir o retorno nas consultas realizadas na pasta `2_consultas_parte_1`.

---

### 2. Pasta: `2_consultas_parte_1`
Contém todas as consultas solicitadas na Parte 1 do desafio, separadas em arquivos individuais e um arquivo consolidado:
- `1_consumo_produto_e_mes.sql` -> Consulta 1.1
- `2_produtos_requisicao_pendente.sql` -> Consulta 1.2
- `3_produtos_nao_consumidos_nao_recebidos.sql` -> Consulta 1.3
- `4_consultas_part_1_consolidadas.sql` -> Todas as consultas da Parte 1 em um único arquivo.

---

### 3. Pasta: `3_consulta_parte_2`
Contém a consulta solicitada na Parte 2 do desafio:
- `1_transformacao_de_dados.sql` -> Realiza as transformações pedidas (concatenação de campos, formatação de datas e filtragem).

---

## Observação
O script de inserção de dados fictícios foi criado com o objetivo de permitir o teste e a visualização prática dos resultados das consultas solicitadas.

---