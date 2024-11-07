DROP TRIGGER AtualizarResumoReserva;

DELIMITER $

CREATE TRIGGER AtualizarResumoReserva
AFTER INSERT ON reservas
FOR EACH ROW
BEGIN
	DECLARE vDescontoAplicado DECIMAL(10,2) DEFAULT CalcularDescontoAplicado(NEW.reserva_id);
	DECLARE vValorFinal DECIMAL(10,2) DEFAULT CalcularPrecoFinal(NEW.reserva_id);
	
    INSERT INTO resumo_aluguel
    VALUES(NEW.reserva_id, NEW.cliente_id, NEW.preco_total, vDescontoAplicado, vValorFinal);
END$

DELIMITER ;

INSERT INTO reservas
VALUES(10017, 42, 15, '2024-01-01', '2024-01-08', 3000);

SELECT * FROM resumo_aluguel;

SELECT * FROM reservas ORDER BY reserva_id DESC;