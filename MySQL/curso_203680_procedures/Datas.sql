#DAYOFWEEK
USE `insight_places`;
DROP procedure IF EXISTS `insight_places`.`nova_reserva_13`;
DELIMITER $$
USE `insight_places`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `nova_reserva_13`
(vReserva VARCHAR(10), vClienteNome VARCHAR(100), vHospedagem VARCHAR(10),
vDataInicio DATE, vDias INTEGER, vPrecoDiaria DECIMAL(10,2))
BEGIN
	DECLARE vCliente VARCHAR(20);
	DECLARE vDataFim DATE;
    DECLARE vNumCliente INT;
    DECLARE vContador INT;
    DECLARE VDiaSemana INT;
	DECLARE vPrecoTotal DECIMAL(10,2);
    DECLARE vMsg VARCHAR(100);
    
    DECLARE EXIT HANDLER FOR 1452
    BEGIN
		SET vMsg = 'Problema de chave estrangeira, associado alguma entidade da base';
        SELECT vMsg;
    END;
    DECLARE EXIT HANDLER FOR 1062
    BEGIN
		SET vMsg = 'Registro duplicado, uma reserva já existe com esse identificador';
        SELECT vMsg;
    END;
    SET vNumCliente = (SELECT COUNT(*) FROM clientes WHERE nome = vClienteNome);
    CASE 
    #EXPRESSÃO LÓGICA ABAIXO, PODE SER MAIS COMPLEXA
    WHEN vNumCliente = 0 THEN
		SET vMsg = "Cliente INEXISTENTE, impossível fazer a reserva";
        SELECT vMsg;
    WHEN vNumCliente = 1 THEN
    
		SET vContador = 1;
        SET vDataFim = vDataInicio;
        WHILE vContador < vDias
        DO
			SET vDiaSemana = (SELECT DAYOFWEEK(STR_TO_DATE(vDataFim, '%Y-%m-%d')));
            IF(vDiaSemana <> 7 AND vDiaSemana <> 1) THEN
				SET vContador = vContador + 1;
			END IF;
            SET vDataFim = (SELECT vDataFim + INTERVAL 1 DAY);
        END WHILE;
    
        SET vPrecoTotal = vDias * vPrecoDiaria;
        SELECT cliente_id INTO vCliente FROM clientes WHERE nome = vClienteNome;
		INSERT INTO reservas 
		VALUES (vReserva, vCliente, vHospedagem, vDataInicio, vDataFim, vPrecoTotal);
		SET vMsg = 'Reserva feita com sucesso';
		SELECT vMsg;
	WHEN vNumCliente > 1 THEN
		SET vMsg = "Cliente ambíguo, não pode ser feita a reserva pelo nome";
        SELECT vMsg;
	END CASE;
END$$
DELIMITER ;

#MOD - Testa se um valor é divisível por outro e retorna um valor lógico, 1 se true 0 se false
SELECT MOD(DAY('2023-04-09'), 3) = 0;