USE `sucos_vendas`;
DROP procedure IF EXISTS `classifica_sabores_erro1339`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `classifica_sabores_erro1339` (vCod VARCHAR(11))
BEGIN
	DECLARE vResultado VARCHAR(20);
	DECLARE vSabor VARCHAR(20);
	DECLARE vMsgErro VARCHAR(50);
	DECLARE CONTINUE HANDLER FOR 1339 SET vMsgErro = 'Caso da consulta não encontrado';
    
	SELECT SABOR INTO vSabor FROM tabela_de_produtos WHERE codigo_do_produto = vCod;
    
    CASE vSabor
		WHEN 'Lima/Limão'
		THEN SET vResultado = 'Cítrico';
		WHEN 'Laranja'
		THEN SET vResultado = 'Cítrico';
		WHEN 'Maracuja'
		THEN SET vResultado = 'Cítrico';
		WHEN 'Morango'
		THEN SET vResultado = 'Cítrico';
		WHEN 'Uva'
		THEN SET vResultado = 'Neutro';
        WHEN 'Maça'
		THEN SET vResultado = 'Neutro';
        WHEN 'Açai'
		THEN SET vResultado = 'Neutro';
    END CASE;
    
    SELECT vResultado, vSabor, vMsgErro;
    
END$$
DELIMITER ;

CALL classifica_sabores_erro1339('1003427');