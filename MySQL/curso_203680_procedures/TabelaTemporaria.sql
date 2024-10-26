#Gravando dados String em uma tabela temporária Tabela Temporarária

USE `insight_places`;
DROP procedure IF EXISTS `insight_places`.`inclui_nomes_lista`;

DELIMITER $$
USE `insight_places`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `inclui_nomes_lista`(lista VARCHAR(255))
BEGIN
	DECLARE nome VARCHAR(255);
	DECLARE restante VARCHAR(255);
	DECLARE posi INTEGER;
    
    SET restante = lista;
    WHILE INSTR(restante, ',') > 0 DO
		SET posi = INSTR(restante, ',');
        SET nome = LEFT(restante, posi -1);
        INSERT INTO temp_nomes VALUES (nome);
        SET restante = SUBSTRING(restante, posi + 1);
	END WHILE;
    IF TRIM(restante) <> '' THEN
		INSERT INTO temp_nomes VALUES (TRIM(restante));
	END IF;
END$$

DELIMITER ;


DROP TEMPORARY TABLE IF EXISTS temp_nomes;
CREATE TEMPORARY TABLE temp_nomes(nome VARCHAR(255));
CALL inclui_nomes_lista("Davi Antunes,Luciano Seberino,Otavio Cobol,André Felicio,Maxwell II");

SELECT * FROM temp_nomes;

