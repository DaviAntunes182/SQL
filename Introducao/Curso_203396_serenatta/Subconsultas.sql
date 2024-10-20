#SubConsultas
SELECT
	nome,
    telefone,
    email
FROM
	clientes
WHERE id = (SELECT idcliente FROM pedidos WHERE datahorapedido = "2023-01-02 08:15:00");

#Usando IN
SELECT
	nome
FROM
	clientes
WHERE id IN (SELECT idcliente FROM pedidos WHERE month(datahorapedido) = '01');

SELECT
	nome,
    preco
FROM 
	produtos
HAVING preco >= (SELECT	AVG(preco) FROM produtos);