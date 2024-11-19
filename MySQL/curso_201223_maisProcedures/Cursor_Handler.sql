USE `sucos_vendas`;
DROP procedure IF EXISTS `cursores_handler`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `cursores_handler` (vLimite INT)
BEGIN
	DECLARE vFim_do_cursor INT DEFAULT 0;
	DECLARE vContador INT DEFAULT 0;
	DECLARE vNome VARCHAR(50);
	DECLARE vNomes VARCHAR(1000) DEFAULT '';
	
    DECLARE vCursor CURSOR FOR SELECT NOME FROM tabela_de_clientes LIMIT vLimite;
    #Definindo um tratamento para exception not found, para interromper o loop ao invés do programa
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET vFim_do_cursor =1;
    OPEN vCursor;
    WHILE vFim_do_cursor = 0
	DO 
		FETCH vCursor INTO vNome;
        IF vFim_do_cursor = 0 THEN 
			SELECT vNome;
			SET vNomes = CONCAT(vNomes, ' ', vNome);
            SET vContador = vContador + 1;
		ELSE
			SELECT 
				CONCAT('Acabaram as correspondências para o cursor, ', 
                vContador,
                ' nomes encontrados') AS Mensagem;
		END IF;
    END WHILE;
	CLOSE vCursor;
    SELECT vNomes;
END$$
DELIMITER ;

CALL cursores_handler(20);