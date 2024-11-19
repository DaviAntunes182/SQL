USE `sucos_vendas`;
DROP procedure IF EXISTS `inserindo_produto`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `inserindo_produto` ()
BEGIN
	DECLARE vCodigo VARCHAR(50) DEFAULT '';
	DECLARE vNome VARCHAR(50) DEFAULT '';
	DECLARE vSabor VARCHAR(50) DEFAULT '';
	DECLARE vTamanho VARCHAR(50) DEFAULT '';
	DECLARE vEmbalagem VARCHAR(50) DEFAULT '';
	DECLARE vPreco	DECIMAL(10,2) DEFAULT '';

	INSERT INTO tabela_de_produtos (CODIGO_DO_PRODUTO,NOME_DO_PRODUTO,SABOR,TAMANHO,EMBALAGEM,PRECO_DE_LISTA)
	VALUES (vCodigo, vNome, vSabor, vTamanho, vEmbalagem, vPreco);

END$$
DELIMITER ;

USE `sucos_vendas`;
DROP procedure IF EXISTS `inserindo_produto_parametros`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `inserindo_produto_parametros` (
	vCodigo VARCHAR(50),
	vNome VARCHAR(50),
	vSabor VARCHAR(50),
	vTamanho VARCHAR(50),
	vEmbalagem VARCHAR(50),
	vPreco	DECIMAL(10,2))
BEGIN

	INSERT INTO tabela_de_produtos (CODIGO_DO_PRODUTO,NOME_DO_PRODUTO,SABOR,TAMANHO,EMBALAGEM,PRECO_DE_LISTA)
	VALUES (vCodigo, vNome, vSabor, vTamanho, vEmbalagem, vPreco);

END$$
DELIMITER ;

CALL inserindo_produto_parametros("4000001", 'Sabor do Pantanal 1 Litro - MeLancia', 'Melancia', '1 Litro', 'Pet', 4.67);
