SELECT
	pr.nome,
    SUM(i.precounitario)
FROM 
	pedidos p
JOIN itenspedidos i
ON p.id = i.idpedido
JOIN produtos pr
ON i.idproduto = pr.id
GROUP BY pr.nome;

SELECT
	c.nome,
    SUM(i.precounitario)
FROM 
	clientes c
JOIN pedidos p
ON p.idcliente = c.id
JOIN itenspedidos i
ON p.id = i.idpedido
GROUP BY c.nome;

SELECT
	c.nome,
    SUM(i.quantidade)
FROM 
	clientes c
JOIN pedidos p
ON p.idcliente = c.id
JOIN itenspedidos i
ON p.id = i.idpedido
GROUP BY c.nome;

SELECT
	p.id,
    SUM(i.precounitario)
FROM 
	clientes c
JOIN pedidos p
ON p.idcliente = c.id
JOIN itenspedidos i
ON p.id = i.idpedido
GROUP BY p.id;