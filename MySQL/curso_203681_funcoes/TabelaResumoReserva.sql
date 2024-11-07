CREATE TABLE resumo_reserva(
	reserva_id INT,
	cliente_id INT,
    valor_total DECIMAL(10,2),
    desconto_aplicado DECIMAL(10,2),
    valor_final DECIMAL(10,2),
    primary key (reserva_id, cliente_id),
    FOREIGN KEY (reserva_id) REFERENCES reservas(reserva_id),
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
);

CALL ConsultarReserva(1);

SELECT CalcularDescontoAplicado(1);