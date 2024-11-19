USE `sucos_vendas`;
DROP procedure IF EXISTS `cursores_colunas`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `cursores_colunas` ()
BEGIN
	DECLARE vFim_do_cursor INT DEFAULT 0;
	DECLARE vCidade, vEstado, vCep VARCHAR(50);
	DECLARE vNome, vEndereco VARCHAR(100);
	
    #Cursor para várias colunas
    DECLARE vCursor CURSOR FOR 
		SELECT nome, endereco_1, cidade, estado, cep FROM tabela_de_clientes;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET vFim_do_cursor =1;
    OPEN vCursor;
    WHILE vFim_do_cursor = 0
	DO 
		FETCH vCursor INTO vNome, vEndereco, vCidade, vEstado, vCep;
        IF vFim_do_cursor = 0 THEN 
			SELECT CONCAT(vNome,': ', vEstado,' - ', vCidade, ' ', vEndereco, ' ', vCep);
		ELSE
			SELECT 
				CONCAT('Acabaram as correspondências para o cursor, ') AS MENSAGEM;
		END IF;
    END WHILE;
	CLOSE vCursor;
END$$
DELIMITER ;

CALL cursores_colunas();