CREATE TABLE FaturamentoDiario(
	Dia DATE,
    FaturamentoTotal decimal(10,2)
);

DELIMITER $
CREATE TRIGGER tg_FaturamentoDiario AFTER INSERT 
ON itenspedidos
FOR EACH ROW
BEGIN
	DELETE FROM FaturamentoDiario WHERE Dia IS NOT NULL;
	INSERT INTO FaturamentoDiario
	SELECT
		date(p.datahorapedido) AS Dia,
		SUM(i.precounitario) AS FaturamentoDiario
	FROM
		pedidos p
	JOIN itenspedidos i
	ON p.id = i.idpedido
	GROUP BY Dia
	ORDER BY Dia;
END;

INSERT INTO FaturamentoDiario
SELECT
	date(p.datahorapedido) AS Dia,
	SUM(i.precounitario) AS FaturamentoDiario
FROM
	pedidos p
JOIN itenspedidos i
ON p.id = i.idpedido
GROUP BY Dia
ORDER BY Dia;
    
SELECT * FROM FaturamentoDiario;