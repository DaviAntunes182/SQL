#INTERVAL - Conta dias corridos
USE `insight_places`;
DROP procedure IF EXISTS `insight_places`.`nova_reserva_12`;
DELIMITER $$
USE `insight_places`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `nova_reserva_12`
(vReserva VARCHAR(10), vClienteNome VARCHAR(100), vHospedagem VARCHAR(10),
vDataInicio DATE, vDias INTEGER, vPrecoDiaria DECIMAL(10,2))
BEGIN
	DECLARE vCliente VARCHAR(20);
	DECLARE vDataFim DATE;
    DECLARE vNumCliente INT;
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
		-- SET vDias = (SELECT datediff(vDataFim, vDataInicio));
		SET vDataFim = (SELECT vDataInio + INTERVAL vDias DAY);
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