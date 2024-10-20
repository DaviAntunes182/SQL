ALTER VIEW vw_cliente AS
SELECT
	nome,
    endereco
FROM
	clientes c;

CREATE VIEW vw_TotalPorProduto AS    
SELECT
	pr.nome,
    SUM(i.precounitario) AS totalvendas
FROM 
	pedidos p
JOIN itenspedidos i
ON p.id = i.idpedido
JOIN produtos pr
ON i.idproduto = pr.id
GROUP BY pr.nome;

ALTER VIEW vw_TotalPorCliente AS    

SELECT
	c.nome,
    SUM(i.precounitario) totalvendas
FROM 
	clientes c
JOIN pedidos p
ON p.idcliente = c.id
JOIN itenspedidos i
ON p.id = i.idpedido
GROUP BY c.nome;

SELECT * FROM vw_TotalPorCliente;
SELECT * FROM vw_TotalPorProduto;