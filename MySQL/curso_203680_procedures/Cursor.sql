#CURSOR
USE `insight_places`;
DROP procedure IF EXISTS `looping_cursor_01`;

USE `insight_places`;
DROP procedure IF EXISTS `insight_places`.`looping_cursor_01`;

DELIMITER $$
USE `insight_places`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `looping_cursor_01`()
BEGIN
	DECLARE fimCursor INTEGER DEFAULT 0;
    DECLARE vNome VARCHAR(255);
    -- DECLARE vEmail VARCHAR(255);
    
    DECLARE cursor1 CURSOR FOR SELECT nome FROM temp_nomes;
    -- DECLARE cursor1 CURSOR FOR SELECT nome, email FROM temp_nomes;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fimCursor =1;
    OPEN cursor1;
    FETCH cursor1 INTO vNome;
    -- FETCH cursor1 INTO vNome, vEmail;
    WHILE fimCursor = 0 DO
        SELECT vNome, vEmail;
		FETCH cursor1 INTO vNome;
		-- FETCH cursor1 INTO vNome, vEmail;
	END WHILE;
    CLOSE cursor1;
END$$

DELIMITER ;

DROP TEMPORARY TABLE IF EXISTS temp_nomes;
CREATE TEMPORARY TABLE temp_nomes(nome VARCHAR(255));
CALL inclui_nomes_lista("João,Pedro,Maria,Lucia,Joana,Beatriz");

SELECT * FROM temp_nomes;

CALL looping_cursor_01();