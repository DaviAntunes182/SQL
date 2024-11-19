USE `sucos_vendas`;
DROP procedure IF EXISTS `classifica_cliente`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `classifica_cliente` (vCPF VARCHAR(11))
BEGIN
	DECLARE vResultado VARCHAR(20);
	DECLARE vDataNascimento DATE;
    
	SELECT DATA_DE_NASCIMENTO INTO vDataNascimento FROM tabela_de_clientes WHERE CPF = vCPF;
    
    IF vDataNascimento < '20000101' THEN
		SET vResultado = 'ADULTO';
	ELSE
		SET vResultado = 'JOVEM';
    END IF;
    
    SELECT vResultado;
    
END$$
DELIMITER ;

CALL classificando_cliente('1471156710');