#IF ELSE IF ELSE
USE `insight_places`;
DROP procedure IF EXISTS `insight_places`.`nova_reserva_08`;
DELIMITER $$
USE `insight_places`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `nova_reserva_08`
(vReserva VARCHAR(10), vClienteNome VARCHAR(100), vHospedagem VARCHAR(10),
vDataInicio DATE, vDataFim DATE, vPrecoDiaria DECIMAL(10,2))
BEGIN
	DECLARE vCliente VARCHAR(20);
	DECLARE vDias INT DEFAULT 0;
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

    #IF
    SET vNumCliente = (SELECT COUNT(*) FROM clientes WHERE nome = vClienteNome);
    IF vNumCliente > 1 THEN
		SET vMsg = "Cliente ambíguo, não pode ser feita a reserva pelo nome";
        SELECT vMsg;
	ELSE
        SET vDias = (SELECT datediff(vDataFim, vDataInicio));
		SET vPrecoTotal = vDias * vPrecoDiaria;
        SELECT cliente_id INTO vCliente FROM clientes WHERE nome = vClienteNome;
		INSERT INTO reservas 
		VALUES (vReserva, vCliente, vHospedagem, vDataInicio, vDataFim, vPrecoTotal);
		SET vMsg = 'Reserva feita com sucesso';
		SELECT vMsg;
    END IF;
END$$
DELIMITER ;

SELECT * FROM reservas WHERE reserva_id IN (10001, 10002, 10003, 10004, 10005, 10006);
CALL nova_reserva_08(10007, "Júlia Pires", 8635, '2023-03-30', '2023-04-04', 40);

SELECT COUNT(*) FROM clientes WHERE nome = "Júlia Pires";

#ELSEIF
USE `insight_places`;
DROP procedure IF EXISTS `insight_places`.`nova_reserva_09`;
DELIMITER $$
USE `insight_places`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `nova_reserva_09`
(vReserva VARCHAR(10), vClienteNome VARCHAR(100), vHospedagem VARCHAR(10),
vDataInicio DATE, vDataFim DATE, vPrecoDiaria DECIMAL(10,2))
BEGIN
	DECLARE vCliente VARCHAR(20);
	DECLARE vDias INT DEFAULT 0;
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

    #IF
    SET vNumCliente = (SELECT COUNT(*) FROM clientes WHERE nome = vClienteNome);
    IF vNumCliente > 1 THEN
		SET vMsg = "Cliente ambíguo, não pode ser feita a reserva pelo nome";
        SELECT vMsg;
	ELSEIF vNumCliente = 0 THEN
		SET vMsg = "Cliente INEXISTENTE, impossível fazer a reserva";
        SELECT vMsg;
	ELSE
        SET vDias = (SELECT datediff(vDataFim, vDataInicio));
		SET vPrecoTotal = vDias * vPrecoDiaria;
        SELECT cliente_id INTO vCliente FROM clientes WHERE nome = vClienteNome;
		INSERT INTO reservas 
		VALUES (vReserva, vCliente, vHospedagem, vDataInicio, vDataFim, vPrecoTotal);
		SET vMsg = 'Reserva feita com sucesso';
		SELECT vMsg;
    END IF;
END$$
DELIMITER ;

CALL nova_reserva_09(10008, "Davi Antunes", 8635, '2023-03-30', '2023-04-04', 40);
