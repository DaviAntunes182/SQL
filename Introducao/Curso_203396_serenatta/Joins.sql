#InnerJoin - clientes que tem pedido e pedidos que tem cliente
SELECT
	c.id AS id_cliente,
	c.nome,
    p.id AS pedido
FROM
	clientes c
INNER JOIN pedidos p
ON c.id = p.idcliente;

INSERT INTO produtos
VALUES (31, 'Lasanha a Bolonhesa', 'Deliciosa lasanha caseira com molho bolonhesa', 12.50, 'Almoço');

#Right Join -> A lasanha ainda não foi vendida
#Quais outros produtos ainda não foram vendidos
#Right mostra valores que não correspondem na tabela da direita JOIN
SELECT
	p.nome,
    p.id,
    i.idpedido
FROM
	itenspedidos i
RIGHT JOIN produtos p
ON p.id = i.idproduto;


SELECT
	p.nome,
    p.id,
    x.idpedido
FROM
	(SELECT
		i.idpedido,
        i.idproduto
	FROM
		pedidos p
	JOIN itenspedidos i
    ON p.id = i.idpedido
    WHERE MONTH(p.datahorapedido) = 10) x
RIGHT JOIN produtos p
ON p.id = x.idproduto
ORDER BY x.idpedido;

#LeftJoin -> Mesma coisa do Right mas pro outro lado
SELECT
	c.id,
	c.nome,
    x.id
FROM
	clientes c
LEFT JOIN (
SELECT
	p.id,
    p.idcliente
FROM
	pedidos p
WHERE month(datahorapedido) = '10') x
ON c.id = x.idcliente
WHERE x.idcliente IS NULL;

#FULLJOIN retorna todos os valores sejam das duas tabelas mesmo que nulas
SELECT
	c.id,
    c.nome,
    p.id AS 'ID PEDIDO'
FROM
	clientes c
LEFT OUTER JOIN pedidos p
ON c.id = p.idcliente
UNION ALL
SELECT
	c.id,
    c.nome,
    p.id AS 'ID PEDIDO'
FROM
	pedidos p
LEFT OUTER JOIN clientes c
ON c.id = p.idcliente
WHERE c.id IS NULL;
