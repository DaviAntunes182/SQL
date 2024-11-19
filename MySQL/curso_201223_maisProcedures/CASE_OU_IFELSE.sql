USE `sucos_vendas`;
DROP procedure IF EXISTS `classifica_sabores_caseif`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `classifica_sabores_caseif` (vCod VARCHAR(11))
BEGIN
	DECLARE vResultadoCase VARCHAR(20);
	DECLARE vResultadoIF VARCHAR(20);
	DECLARE vPreco DECIMAL(6,2);
    
	SELECT PRECO_DE_LISTA INTO vPreco FROM tabela_de_produtos WHERE codigo_do_produto = vCod;
    
    CASE
		WHEN vPreco >= 12 THEN SET vResultadoCase = 'PRODUTO CARO';
		WHEN vPreco >= 7 THEN SET vResultadoCase = 'PRODUTO EM CONTA';
		WHEN vPreco < 7 THEN SET vResultadoCase = 'PRODUTO BARATO';
    END CASE;
    
    IF vPreco >= 12 THEN
		SET vResultadoIF = 'PRODUTO CARO';
	ELSEIF vPreco >= 7 THEN
		SET vResultadoIF = 'PRODUTO EM CONTA';
	ELSE
		SET vResultadoIF = 'PRODUTO BARATO';
    END IF;
    
    SELECT vResultadoIF, vResultadoCase;
END$$
DELIMITER ;

CALL classifica_sabores_caseif('1000889');