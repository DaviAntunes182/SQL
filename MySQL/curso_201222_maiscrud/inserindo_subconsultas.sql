#Importando dados de sucos_vendas, baseado em uma consulta
SELECT * FROM sucos_vendas.tabela_de_produtos;

INSERT INTO produtos
SELECT 
	CODIGO_DO_PRODUTO AS cod_produto,
    NOME_DO_PRODUTO AS descritor,
    SABOR AS sabor,
    TAMANHO AS tamanho,
    EMBALAGEM AS embalagem,
    PRECO_DE_LISTA AS preco_lista
FROM sucos_vendas.tabela_de_produtos
WHERE CODIGO_DO_PRODUTO NOT IN (SELECT cod_produto FROM produtos);

SELECT * FROM produtos;

-- 

INSERT INTO clientes
(CPF,NOME,ENDERECO,BAIRRO,CIDADE,ESTADO,CEP,DATA_NASCIMENTO,IDADE,SEXO,LIMITE_CREDITO,VOLUME_COMPRA,PRIMEIRA_COMPRA)
SELECT 
	CPF, 
	NOME, 
    ENDERECO_1 AS ENDERECO, 
    BAIRRO, 
    CIDADE, 
    ESTADO, 
    CEP,
    DATA_DE_NASCIMENTO AS  DATA_NASCIMENTO, 
    IDADE, 
    SEXO,
    LIMITE_DE_CREDITO AS LIMITE_CREDITO, 
    VOLUME_DE_COMPRA AS VOLUME_COMPRA,
    PRIMEIRA_COMPRA 
FROM sucos_vendas.tabela_de_clientes 
WHERE CPF NOT IN (SELECT CPF FROM clientes);

SELECT * FROM clientes;

INSERT INTO vendedores
VALUES(235, 'Márcio Almeida Silva', 'Tijuca', 0.08, '2014-08-15', null),
(236, 'Cláudia Morais', 'Jardins', 0.08, '2013-09-17', null),
(237, 'Roberta Martins', 'Copacabana', 0.11, '2017-03-18', null),
(238, 'Péricles Alves', 'Santo Amaro', 0, '2016-08-21', null);