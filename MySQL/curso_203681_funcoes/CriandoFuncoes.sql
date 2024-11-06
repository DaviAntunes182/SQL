DELIMITER $$
CREATE FUNCTION FuncaoExemplo()
RETURNS FLOAT DETERMINISTIC 
BEGIN
DECLARE vResultado FLOAT;
SET vResultado = 4 * 8;

RETURN vResultado;

END$$
DELIMITER ;
DELIMITER $$
CREATE FUNCTION ConsultaCPF(vClienteNome VARCHAR(100))
RETURNS VARCHAR(50) DETERMINISTIC
BEGIN
DECLARE vResultado VARCHAR(50);
SET vResultado = (
	SELECT
		cpf
	FROM clientes
	WHERE cliente_id = (
		SELECT
			cliente_id
        FROM clientes
        WHERE nome = vClienteNome)
);

RETURN vResultado;

END$$
DELIMITER ;

SELECT ConsultaCPF('Cauê Sales');
    
DELIMITER $$
CREATE FUNCTION InfoAluguel(vAluguelId INT)
RETURNS VARCHAR(100) DETERMINISTIC
BEGIN
	DECLARE vResultado VARCHAR(100);
	SELECT
		CONCAT(c.nome, ' pagou ' ,ROUND(r.preco_total / (DATEDIFF(r.data_fim, r.data_inicio)),2), ' na diária')
	FROM reservas r
	INNER JOIN clientes c
	ON r.cliente_id = c.cliente_id
	INTO vResultado;
END$$
DELIMITER ;

SELECT
	CONCAT(c.nome, ' pagou ' ,ROUND(r.preco_total / (DATEDIFF(r.data_fim, r.data_inicio)),2), ' na diária') AS Info
FROM reservas r
INNER JOIN clientes c
ON r.cliente_id = c.cliente_id;