USE `insight_places`;
DROP procedure IF EXISTS `insight_places`.`novo_aluguel_01`;
DELIMITER $$
USE `insight_places`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `novo_aluguel_01`()
BEGIN
	DECLARE vAluguel VARCHAR(10) DEFAULT 10001;
	DECLARE vCliente VARCHAR(10) DEFAULT 1002;
	DECLARE vHospedagem VARCHAR(10) DEFAULT 8635;
	DECLARE vDataInicio DATE DEFAULT '2023-03-01';
	DECLARE vDataFim DATE DEFAULT '2023-03-05';
	DECLARE vPrecoTotal DECIMAL(10,2) DEFAULT 550.23;
    
    SELECT 
		vAluguel,
        vCliente,
        vHospedagem,
        vDataInicio,
        vDataFIM,
        vPrecoTotal;
END$$
DELIMITER ;

USE `insight_places`;
DROP procedure IF EXISTS `insight_places`.`nova_reserva_02`;
DELIMITER $$
USE `insight_places`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `nova_reserva_02`()
BEGIN
	DECLARE vReserva VARCHAR(10) DEFAULT 10001;
	DECLARE vCliente VARCHAR(10) DEFAULT 1002;
	DECLARE vHospedagem VARCHAR(10) DEFAULT 8635;
	DECLARE vDataInicio DATE DEFAULT '2023-03-01';
	DECLARE vDataFim DATE DEFAULT '2023-03-05';
	DECLARE vPrecoTotal DECIMAL(10,2) DEFAULT 550.23;
    
    INSERT INTO reservas 
    VALUES (vReserva, vCliente, vHospedagem, vDataInicio, vDataFim, vPrecoTotal);
END$$
DELIMITER ;

USE `insight_places`;
DROP procedure IF EXISTS `insight_places`.`nova_reserva_03`;
DELIMITER $$
USE `insight_places`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `nova_reserva_03`
(vReserva VARCHAR(10), vCliente VARCHAR(10), vHospedagem VARCHAR(10),
vDataInicio DATE, vDataFim DATE, vPrecoTotal DECIMAL(10,2))
BEGIN
    INSERT INTO reservas 
    VALUES (vReserva, vCliente, vHospedagem, vDataInicio, vDataFim, vPrecoTotal);
END$$
DELIMITER ;

CALL nova_reserva_03(10002, 1003, 8635, '2023-03-06', '2023-03-10', 600);
CALL nova_reserva_03(10003, 1004, 8635, '2023-03-10', '2023-03-12', 250);


USE `insight_places`;
DROP procedure IF EXISTS `insight_places`.`nova_reserva_04`;
DELIMITER $$
USE `insight_places`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `nova_reserva_04`
(vReserva VARCHAR(10), vCliente VARCHAR(10), vHospedagem VARCHAR(10),
vDataInicio DATE, vDataFim DATE, vPrecoDiaria DECIMAL(10,2))
BEGIN
	DECLARE vDias INT DEFAULT 0;
	DECLARE vPrecoTotal DECIMAL(10,2);
    SET vDias = (SELECT datediff(vDataFim, vDataInicio));
    SET vPrecoTotal = vDias * vPrecoDiaria;
    
    INSERT INTO reservas 
    VALUES (vReserva, vCliente, vHospedagem, vDataInicio, vDataFim, vPrecoTotal);
END$$
DELIMITER ;

CALL nova_reserva_04(10004, 1004, 8635, '2023-03-13', '2023-03-16', 40);

SELECT * FROM reservas WHERE reserva_id IN (10001, 10002, 10003, 10004);

USE `insight_places`;
DROP procedure IF EXISTS `insight_places`.`nova_reserva_05`;
DELIMITER $$
USE `insight_places`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `nova_reserva_05`
(vReserva VARCHAR(10), vCliente VARCHAR(10), vHospedagem VARCHAR(10),
vDataInicio DATE, vDataFim DATE, vPrecoDiaria DECIMAL(10,2))
BEGIN
	DECLARE vDias INT DEFAULT 0;
	DECLARE vPrecoTotal DECIMAL(10,2);
    DECLARE vMsg VARCHAR(100);
    DECLARE EXIT HANDLER FOR 1452
    BEGIN
		SET vMsg = 'Problema de chave estrangeira, associado alguma entidade da base';
        SELECT vMsg;
    END;
    SET vDias = (SELECT datediff(vDataFim, vDataInicio));
    SET vPrecoTotal = vDias * vPrecoDiaria;
	
    INSERT INTO reservas 
    VALUES (vReserva, vCliente, vHospedagem, vDataInicio, vDataFim, vPrecoTotal);
	SET vMsg = 'Reserva feita com sucesso';
    SELECT vMsg;
END$$
DELIMITER ;

CALL nova_reserva_05(10005, 1004, 8635, '2023-03-17', '2023-03-25', 40);

USE `insight_places`;
DROP procedure IF EXISTS `insight_places`.`nova_reserva_06`;
DELIMITER $$
USE `insight_places`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `nova_reserva_06`
(vReserva VARCHAR(10), vCliente VARCHAR(10), vHospedagem VARCHAR(10),
vDataInicio DATE, vDataFim DATE, vPrecoDiaria DECIMAL(10,2))
BEGIN
	DECLARE vDias INT DEFAULT 0;
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
    SET vDias = (SELECT datediff(vDataFim, vDataInicio));
    SET vPrecoTotal = vDias * vPrecoDiaria;
	
    INSERT INTO reservas 
    VALUES (vReserva, vCliente, vHospedagem, vDataInicio, vDataFim, vPrecoTotal);
	SET vMsg = 'Reserva feita com sucesso';
    SELECT vMsg;
END$$
DELIMITER ;

# SELECT INTO
USE `insight_places`;
DROP procedure IF EXISTS `insight_places`.`nova_reserva_07`;
DELIMITER $$
USE `insight_places`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `nova_reserva_07`
(vReserva VARCHAR(10), vClienteNome VARCHAR(100), vHospedagem VARCHAR(10),
vDataInicio DATE, vDataFim DATE, vPrecoDiaria DECIMAL(10,2))
BEGIN
	DECLARE vCliente VARCHAR(20);
	DECLARE vDias INT DEFAULT 0;
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
    
    SET vDias = (SELECT datediff(vDataFim, vDataInicio));
    SET vPrecoTotal = vDias * vPrecoDiaria;
	
    SELECT cliente_id INTO vCliente FROM clientes WHERE Nome = vClienteNome;
    
    INSERT INTO reservas 
    VALUES (vReserva, vCliente, vHospedagem, vDataInicio, vDataFim, vPrecoTotal);
	SET vMsg = 'Reserva feita com sucesso';
    SELECT vMsg;
END$$
DELIMITER ;

CALL nova_reserva_07(10006, "Luana Moura", 8635, '2023-03-26', '2023-03-30', 40);
SELECT * FROM reservas WHERE reserva_id IN (10001, 10002, 10003, 10004, 10005, 10006);

CALL nova_reserva_07(10007, "Júlia Pires", 8635, '2023-03-30', '2023-04-04', 40);

#Clientes duplicados
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


#CASE END CASE
USE `insight_places`;
DROP procedure IF EXISTS `insight_places`.`nova_reserva_10`;
DELIMITER $$
USE `insight_places`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `nova_reserva_10`
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
    SET vNumCliente = (SELECT COUNT(*) FROM clientes WHERE nome = vClienteNome);
    CASE vNumCliente
    WHEN 0 THEN
		SET vMsg = "Cliente INEXISTENTE, impossível fazer a reserva";
        SELECT vMsg;
    WHEN 1 THEN
		SET vDias = (SELECT datediff(vDataFim, vDataInicio));
		SET vPrecoTotal = vDias * vPrecoDiaria;
        SELECT cliente_id INTO vCliente FROM clientes WHERE nome = vClienteNome;
		INSERT INTO reservas 
		VALUES (vReserva, vCliente, vHospedagem, vDataInicio, vDataFim, vPrecoTotal);
		SET vMsg = 'Reserva feita com sucesso';
		SELECT vMsg;
	ELSE
		SET vMsg = "Cliente ambíguo, não pode ser feita a reserva pelo nome";
        SELECT vMsg;
	END CASE;
END$$
DELIMITER ;

CALL nova_reserva_10(10007, "Davi Antunes", 8635, '2023-03-30', '2023-04-04', 40);
CALL nova_reserva_10(10007, "Luana Moura", 8635, '2023-03-30', '2023-04-04', 40);

#CASE CONDICIONAL
USE `insight_places`;
DROP procedure IF EXISTS `insight_places`.`nova_reserva_11`;
DELIMITER $$
USE `insight_places`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `nova_reserva_11`
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
    SET vNumCliente = (SELECT COUNT(*) FROM clientes WHERE nome = vClienteNome);
    CASE 
    #EXPRESSÃO LÓGICA ABAIXO, PODE SER MAIS COMPLEXA
    WHEN vNumCliente = 0 THEN
		SET vMsg = "Cliente INEXISTENTE, impossível fazer a reserva";
        SELECT vMsg;
    WHEN vNumCliente = 1 THEN
		SET vDias = (SELECT datediff(vDataFim, vDataInicio));
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

CALL nova_reserva_11(10008, "Victorino Vila", 8635, '2023-03-30', '2023-04-04', 40);
CALL nova_reserva_11(10008, "Júlia Pires", 8635, '2023-03-30', '2023-04-04', 40);
CALL nova_reserva_11(10008, "Luana Moura", 8635, '2023-03-30', '2023-04-04', 40);


#TRABALHANDO COM DATAS
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
		SET vDataFim = (SELECT vDataInicio + INTERVAL vDias DAY);
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

CALL nova_reserva_12(10008, "Rafael Peixoto", 8635, '2023-04-05', 5, 40);

SELECT * FROM reservas ORDER BY reserva_id DESC LIMIT 10;


#LOOPING CONDICIONAL - DAY OF THE WEEK
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

CALL nova_reserva_13(10010, "Gabriela Pires", 8635, '2023-04-12', 5, 40);
SELECT * FROM reservas WHERE reserva_id = 10010;

#PROCEDURE COM REFERÊNCIA
USE `insight_places`;
DROP procedure IF EXISTS `insight_places`.`nova_reserva_14`;
DELIMITER $$
USE `insight_places`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `nova_reserva_14`
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
		CALL calculaDataFinal_01(vDataInicio, vDataFim, vDias);
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

CALL nova_reserva_14(10011, "Lívia Fogaça", 8635, '2023-04-20', 10, 40);
SELECT * FROM reservas WHERE reserva_id = 10011;

#AUTOINCREMENT COM FRUFRU
USE `insight_places`;
DROP procedure IF EXISTS `insight_places`.`nova_reserva_15`;
DELIMITER $$
USE `insight_places`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `nova_reserva_15`
(vClienteNome VARCHAR(100), vHospedagem VARCHAR(10),
vDataInicio DATE, vDias INTEGER, vPrecoDiaria DECIMAL(10,2))
BEGIN
	DECLARE vReserva VARCHAR(10);
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
		SET vReserva = (SELECT MAX(reserva_id) + 1 FROM reservas);
		CALL calculaDataFinal_01(vDataInicio, vDataFim, vDias);
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

CALL nova_reserva_15("Lívia Fogaça", 8635, '2023-05-15', 5, 45);
SELECT * FROM reservas WHERE reserva_id = 10012;
