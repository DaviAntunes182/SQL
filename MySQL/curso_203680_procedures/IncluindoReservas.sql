#INCLUINDO VÁRIAS RESERVAS DE UMA VEZ
USE `insight_places`;
DROP procedure IF EXISTS `insight_places`.`novas_reservas_01`;

DELIMITER $$
USE `insight_places`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `novas_reservas_01`
(lista VARCHAR(255), vHospedagem VARCHAR(10),
vDataInicio DATE, vDias INTEGER, vPrecoDiaria DECIMAL(10,2))
BEGIN
	DECLARE vClienteNome VARCHAR(255);
	DECLARE fimCursor INTEGER DEFAULT 0;
    DECLARE vNome VARCHAR(255);
    DECLARE cursor1 CURSOR FOR SELECT nome FROM temp_nomes;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fimCursor =1;
    
	DROP TEMPORARY TABLE IF EXISTS temp_nomes;
	CREATE TEMPORARY TABLE temp_nomes(nome VARCHAR(255));
    CALL inclui_nomes_lista(lista);

    OPEN cursor1;
    FETCH cursor1 INTO vNome;
    WHILE fimCursor = 0 DO
        SET vClienteNome = vNome;
        CALL nova_reserva_15(vClienteNome,vHospedagem,vDataInicio,vDias,vPrecoDiaria);
		FETCH cursor1 INTO vNome;
	END WHILE;
    CLOSE cursor1;
	DROP TEMPORARY TABLE IF EXISTS temp_nomes;
END$$
DELIMITER ;

CALL novas_reservas_01("Gabriel Carvalho,Erick Oliveira,Catarina Correia,Lorena Jesus", 8635, '2023-06-03', 7, 40);
#FORAM APENAS 4
SELECT * FROM reservas WHERE reserva_id IN (10013, 10014, 10015, 10016, 10017);