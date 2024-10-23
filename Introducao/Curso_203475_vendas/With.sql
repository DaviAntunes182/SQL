USE curso_203457_vendas;

SELECT DISTINCT
	year(data_venda) AS Ano,
    month(data_venda) AS Mês,
    count(*) AS "Vendas"
FROM 
	vendas 
GROUP BY Ano, Mês
HAVING MÊS IN(1, 11, 12)
ORDER BY Ano;

SELECT
	CONCAT(month(data_venda),"-",year(data_venda)) AS Data,
	f.nome AS Fornecedor,
    COUNT(i.produto_id) Qtd_vendas
FROM
	itens_venda i
INNER JOIN produtos p
ON i.produto_id = p.id_produto
INNER JOIN fornecedores f
ON p.fornecedor_id = f.id_fornecedor
INNER JOIN vendas v
ON i.venda_id = v.id_venda
GROUP BY Fornecedor, Data
HAVING Data LIKE "11%"
ORDER BY Data;

SELECT
	CONCAT(month(data_venda),"-",year(data_venda)) AS Data,
	c.nome_categoria AS Categoria,
    COUNT(i.produto_id) Qtd_vendas
FROM
	itens_venda i
INNER JOIN produtos p
ON i.produto_id = p.id_produto
INNER JOIN fornecedores f
ON p.fornecedor_id = f.id_fornecedor
INNER JOIN vendas v
ON i.venda_id = v.id_venda
INNER JOIN categorias c
ON p.categoria_id = c.id_categoria
GROUP BY Categoria, Data
HAVING Data LIKE "11%"
ORDER BY Data;

SELECT
	date_format(data_venda, "%Y-%m") AS Data,
    COUNT(i.produto_id) AS Qtd_vendas
FROM
	itens_venda i
INNER JOIN produtos p
ON i.produto_id = p.id_produto
INNER JOIN fornecedores f
ON p.fornecedor_id = f.id_fornecedor
INNER JOIN vendas v
ON i.venda_id = v.id_venda
GROUP BY f.nome, Data
HAVING f.nome LIKE "Neb%"
ORDER BY month(Data);

SELECT
	date_format(data_venda, "%Y-%m") AS Data,
    f.nome,
    COUNT(i.produto_id) AS Qtd_vendas
FROM
	itens_venda i
INNER JOIN produtos p
ON i.produto_id = p.id_produto
INNER JOIN fornecedores f
ON p.fornecedor_id = f.id_fornecedor
INNER JOIN vendas v
ON i.venda_id = v.id_venda
GROUP BY f.nome, f.id_fornecedor, Data
HAVING f.id_fornecedor IN (7, 1, 2) AND Data LIKE "%11"
ORDER BY month(Data);

SELECT
	date_format(data_venda, "%Y-%m") AS Data,
    f.nome,
    COUNT(i.produto_id) AS Qtd_vendas
FROM
	itens_venda i
INNER JOIN produtos p
ON i.produto_id = p.id_produto
INNER JOIN fornecedores f
ON p.fornecedor_id = f.id_fornecedor
INNER JOIN vendas v
ON i.venda_id = v.id_venda
GROUP BY f.nome, f.id_fornecedor, Data
HAVING f.id_fornecedor IN (7, 1, 2)
ORDER BY month(Data);

#Calculando porcentagem do todo
SELECT 
	x.Categoria,
    x.Qtd_Vendas,
    CONCAT(ROUND((Qtd_Vendas/(SELECT COUNT(*) FROM itens_venda) * 100),3),"%") AS Porcentagem
FROM
	(SELECT
		c.nome_categoria AS Categoria,
		COUNT(i.produto_id) AS Qtd_vendas
	FROM
		itens_venda i
	INNER JOIN produtos p
	ON i.produto_id = p.id_produto
	INNER JOIN fornecedores f
	ON p.fornecedor_id = f.id_fornecedor
	INNER JOIN vendas v
	ON i.venda_id = v.id_venda
	INNER JOIN categorias c
	ON p.categoria_id = c.id_categoria
	GROUP BY Categoria
	ORDER BY Qtd_vendas) x;

#Vendar por ano por mês
SELECT
	x.Mes,
    SUM(CASE WHEN Ano="2020" THEN Qtd_vendas ELSE 0 END) AS "2020",
    SUM(CASE WHEN Ano="2021" THEN Qtd_vendas ELSE 0 END) AS "2021",
    SUM(CASE WHEN Ano="2022" THEN Qtd_vendas ELSE 0 END) AS "2022",
    SUM(CASE WHEN Ano="2023" THEN Qtd_vendas ELSE 0 END) AS "2023"
FROM
(SELECT month(data_venda) AS Mes, year(data_venda) AS Ano, COUNT(*) AS Qtd_vendas
FROM vendas
GROUP BY Mes, Ano) x
GROUP BY x.Mes;

#Métrica
SELECT
	avg(Qtd_vendas) AS Media_Vendas
FROM
(SELECT
	COUNT(*) AS Qtd_vendas,
    year(v.data_venda) AS Ano
FROM vendas v
WHERE month(v.data_venda) = 11 AND year(v.data_venda) <> 2022
GROUP BY Ano) AS x;

SELECT
	Qtd_vendas AS Qtd_Vendas_Atual
FROM
(SELECT
	COUNT(*) AS Qtd_vendas,
    year(v.data_venda) AS Ano
FROM vendas v
WHERE month(v.data_venda) = 11 AND year(v.data_venda) = 2022
GROUP BY Ano) AS y;

WITH Media_Vendas_Anteriores AS (SELECT
	avg(Qtd_vendas) AS Media_Qtd_Vendas
FROM
(SELECT
	COUNT(*) AS Qtd_vendas,
    year(v.data_venda) AS Ano
FROM vendas v
WHERE month(v.data_venda) = 11 AND year(v.data_venda) <> 2022
GROUP BY Ano) as x), Vendas_Atual AS (SELECT
	Qtd_vendas AS Qtd_Vendas_Atual
FROM
(SELECT
	COUNT(*) AS Qtd_vendas,
    year(v.data_venda) AS Ano
FROM vendas v
WHERE month(v.data_venda) = 11 AND year(v.data_venda) = 2022
GROUP BY Ano) as y)
SELECT 
	mva.Media_Qtd_Vendas,
    va.Qtd_Vendas_Atual,
    CONCAT(ROUND((va.Qtd_Vendas_Atual - mva.Media_Qtd_Vendas)/mva.Media_Qtd_Vendas * 100, 2), "%") AS Aumento
FROM Vendas_Atual va, Media_Vendas_Anteriores mva;