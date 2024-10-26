ALTER TABLE alugueis RENAME TO reservas;

ALTER TABLE reservas RENAME COLUMN aluguel_id TO reserva_id;

ALTER TABLE proprietarios
ADD COLUMN qtd_hospedagens INT;

UPDATE hospedagens
SET ativo = 1 WHERE hospedagem_id IN (1, 10, 100);

UPDATE proprietarios
SET contato = 'daniela_120@email.com' WHERE proprietario_id IN (1009);

SELECT * FROM hospedagens;
SELECT * FROM proprietarios WHERE proprietario_id IN (1009);