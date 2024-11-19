USE `sucos_vendas`;
DROP procedure IF EXISTS `inserindo_produto_handler`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `inserindo_produto_handler` (
	vCodigo VARCHAR(50),
	vNome VARCHAR(50),
	vSabor VARCHAR(50),
	vTamanho VARCHAR(50),
	vEmbalagem VARCHAR(50),
	vPreco	DECIMAL(10,2))
BEGIN
	DECLARE vMsg VARCHAR(200);
    DECLARE EXIT HANDLER FOR 1062
    BEGIN
		SET vMsg = 'Chave primária duplicada';
        SELECT vMsg AS 'ALERTA!';
    END;
	
    INSERT INTO tabela_de_produtos (CODIGO_DO_PRODUTO,NOME_DO_PRODUTO,SABOR,TAMANHO,EMBALAGEM,PRECO_DE_LISTA)
	VALUES (vCodigo, vNome, vSabor, vTamanho, vEmbalagem, vPreco);

END$$
DELIMITER ;

CALL inserindo_produto_handler("4000001", 'Sabor do Pantanal 1 Litro - MeLancia', 'Melancia', '1 Litro', 'Pet', 4.67);