#CONVERTENDO UMA STRING EM UM INTEIRO

SELECT reserva_id, CAST(reserva_id AS UNSIGNED) FROM reservas;
SELECT MAX(reserva_id), MAX(CAST(reserva_id AS UNSIGNED)) FROM reservas;