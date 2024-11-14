UPDATE produtos SET PRECO_LISTA = 5 WHERE cod_produto = 1000889;

UPDATE produtos SET embalagem = 'PET', tamanho = '1L', descritor = 'Sabor da Montanha - 1 Litro - Uva' WHERE cod_produto = 1000889;

SELECT * FROM produtos WHERE cod_produto = 1000889;

UPDATE produtos SET preco_lista = preco_lista * 1.1 WHERE sabor = 'Maracujá';

SELECT * FROM produtos WHERE sabor = 'Maracujá';

UPDATE clientes
SET ENDERECO = 'R. Jorge Emilio 23',
BAIRRO = 'Santo Amaro',
CIDADE = 'São Paulo',
ESTADO = 'SP',
CEP = '8833223'
WHERE CPF = '19290992743';

SELECT * FROM clientes WHERE cpf = '19290992743';

#Update com FROM(INNER JOIN)
UPDATE vendedores A INNER JOIN sucos_vendas.tabela_de_vendedores B ON A.matricula = substring(B.MATRICULA,3,3)
SET A.ferias = B.DE_FERIAS;

SET SQL_SAFE_UPDATES = 0;

UPDATE clientes A INNER JOIN vendedores B
ON A.BAIRRO = B.BAIRRO
SET A.VOLUME_COMPRA = A.VOLUME_COMPRA * 1.30;