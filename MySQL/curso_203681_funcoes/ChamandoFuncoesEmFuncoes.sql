DELIMITER $
CREATE FUNCTION CalcularDias(vReservaId INT)
RETURNS INT DETERMINISTIC
BEGIN
	DECLARE vDias INT;
    SET vDias = (SELECT
					datediff(data_fim, data_inicio)
				FROM reservas
                WHERE reserva_id = vReservaId);
    RETURN vDias;
END$
DELIMITER ;

DELIMITER $
CREATE FUNCTION CalcularMultiplicador(vReservaId INT)
RETURNS FLOAT DETERMINISTIC
BEGIN
    DECLARE vMultiplicador FLOAT;
    IF CalcularDias(vReservaId) IS NULL OR CalcularDias(vReservaId) <= 0 THEN
		RETURN 0;
	ELSE
		CASE
			#Chamando outra função
			WHEN CalcularDias(vReservaId) >= 10 THEN SET vMultiplicador = 0.85;
			WHEN CalcularDias(vReservaId) >= 7 THEN SET vMultiplicador = 0.9;
			WHEN CalcularDias(vReservaId) >= 4 THEN SET vMultiplicador = 0.95;
			ELSE SET vMultiplicador = 1.0;
		END CASE;
	END IF;
    RETURN vMultiplicador;
END$
DELIMITER ;

DELIMITER $
CREATE FUNCTION CalcularDesconto(vReservaId INT)
RETURNS VARCHAR(3) DETERMINISTIC
BEGIN
    DECLARE vDesconto VARCHAR(3) DEFAULT CONCAT((ROUND(1 - ROUND(CalcularMultiplicador(vReservaId), 2), 2) * 100), '%');
    RETURN vDesconto;
END$
DELIMITER ;


DELIMITER $
CREATE FUNCTION CalcularPrecoFinal(vReservaId INT)
RETURNS FLOAT DETERMINISTIC
BEGIN
	DECLARE vPrecoTotal FLOAT;
    DECLARE vPrecoFinal FLOAT;

	SET vPrecoTotal = (SELECT 
							preco_total 
						FROM reservas 
                        WHERE reserva_id = vReservaId);
	#Chamando uma função em outra função
    SET vPrecoFinal = vPrecoTotal * CalcularMultiplicador(vReservaId);
    RETURN vPrecoFinal;
END$
DELIMITER ;

USE `insight_places`;
DROP procedure IF EXISTS `ConsultarReserva`;

DELIMITER $$
USE `insight_places`$$
CREATE PROCEDURE `ConsultarReserva` (vReservaId INT)
BEGIN
	DECLARE vReserva INT;
    DECLARE vMsg VARCHAR(50);
    DECLARE vDias INT DEFAULT CalcularDias(vReservaId);
    DECLARE vDesconto VARCHAR(3) DEFAULT CalcularDesconto(vReservaId);
    SET vReserva = (SELECT COUNT(*) FROM reservas WHERE reserva_id = vReservaId);
	
    IF vReserva = 1 THEN
		SELECT
			c.nome AS Cliente,
			r.reserva_id AS Reserva,
            ROUND(r.preco_total / vDias, 2) AS 'Diaria Padrão',
            r.data_inicio AS 'Check-in',
            r.data_fim AS Checkout,
            vDias AS Dias,
			r.preco_total AS 'Preco Inicial',
			vDesconto AS 'Desconto',
            CalcularPrecoFinal(vReservaId) AS 'Preco Final'
		FROM reservas r
        INNER JOIN clientes c
        ON r.cliente_id = c.cliente_id
		WHERE reserva_id = vReservaId;
	ELSE SET vMsg = 'A Reserva não existe';
		SELECT vMsg AS 'AVISO!';
	END IF;
END$$
DELIMITER ;

SELECT CalcularPrecoFinal(1);

CALL ConsultarReserva(3000);

DELIMITER $
CREATE FUNCTION CalcularDescontoAplicado(vReservaId INT)
RETURNS FLOAT DETERMINISTIC
BEGIN
    DECLARE vDescontoAplicado FLOAT;
	SET vDescontoAplicado = (SELECT (preco_total * ROUND(1 - CalcularMultiplicador(vReservaId), 2)) FROM reservas WHERE reserva_id = vReservaId);

    RETURN vDescontoAplicado;
END$
DELIMITER ;