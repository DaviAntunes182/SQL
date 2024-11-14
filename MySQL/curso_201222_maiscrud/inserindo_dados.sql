INSERT INTO TB_PRODUTOS(DESCRITOR, SABOR, TAMANHO, EMBALAGEM, PRECO_LISTA)
VALUES('Light - 350 ml - Melância',	'Melância', '350 ml', 'Lata', 4.56);

INSERT INTO TB_PRODUTOS(DESCRITOR, SABOR, TAMANHO, EMBALAGEM, PRECO_LISTA)
VALUES('Light - 350 ml - Graviola',	'Graviola', '350 ml', 'Lata', 4.0);

INSERT INTO TB_PRODUTOS
VALUES(3, 'Light - 350 ml - Açaí',	'Açaí', '350 ml', 'Lata', 5.60);

SELECT * FROM TB_PRODUTOS;

INSERT INTO TB_PRODUTOS(DESCRITOR, SABOR, TAMANHO, EMBALAGEM, PRECO_LISTA)
VALUES(3, 'Light - 350 ml - Açaí',	'Açaí', '350 ml', 'Lata', 5.60);


INSERT INTO TB_PRODUTOS(DESCRITOR, SABOR, TAMANHO, EMBALAGEM, PRECO_LISTA)
VALUES('Light - 350 ml - Jaca',	'Jaca', '350 ml', 'Lata', 6.0),
	  ('Light - 350 ml - Manga', 'Manga', '350 ml', 'Lata', 3.50);
      
INSERT INTO TB_CLIENTES
(CPF,NOME,ENDERECO,BAIRRO,CIDADE,ESTADO,CEP,DATA_NASCIMENTO,IDADE,SEXO,LIMITE_CREDITO,VOLUME_COMPRA,PRIMEIRA_COMPRA)
VALUES 
('1471156710','Érica Carvalho','R. Iriquitia','Jardins','São Paulo','SP','80012212','19900901',27,'F',170000,24500,0),
('19290992743','Fernando Cavalcante','R. Dois de Fevereiro','Água Santa','Rio de Janeiro','RJ','22000000','20000212',18,'M',100000,20000,1),
('2600586709','César Teixeira','Rua Conde de Bonfim','Tijuca','Rio de Janeiro','RJ','22020001','20000312',18,'M',120000,22000,0);

#Importar os dados de sucos_vendas para vendas_sucos kkkkkkkkkk

