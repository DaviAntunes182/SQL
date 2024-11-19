USE `sucos_vendas`;
DROP procedure IF EXISTS `classifica_produto`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `classifica_produto` (vCod VARCHAR(11))
BEGIN
	DECLARE vResultado VARCHAR(20);
	DECLARE vPreco DECIMAL(6,2);
    
	SELECT PRECO_DE_LISTA INTO vPreco FROM tabela_de_produtos WHERE codigo_do_produto = vCod;
    
    IF vPreco >= 12 THEN
		SET vResultado = 'PRODUTO CARO';
	ELSEIF vPreco >= 7 THEN
		SET vResultado = 'PRODUTO EM CONTA';
	ELSE
		SET vResultado = 'PRODUTO BARATO';
    END IF;
    
    SELECT vResultado;
    
END$$
DELIMITER ;

CALL classifica_produto('1086543');