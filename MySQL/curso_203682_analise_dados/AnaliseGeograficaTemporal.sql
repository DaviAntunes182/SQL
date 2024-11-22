# MÉTRICAS POR REGIÕES

SELECT
	r.regiao,
    AVG(preco_total / datediff(data_fim, data_inicio)) AS DIARIA_MEDIA,
    MAX(preco_total / datediff(data_fim, data_inicio)) AS DIARIA_MAXIMA,
    MIN(preco_total / datediff(data_fim, data_inicio)) AS DIARIA_MINIMA,
    AVG(datediff(data_fim, data_inicio)) AS MEDIA_DIAS,
    #SUM(preco_total / datediff(data_fim, data_inicio)) AS Faturamento,
	MONTH(a.data_inicio) AS MES
FROM
alugueis a
JOIN hospedagens h
ON a.hospedagem_id = h.hospedagem_id
JOIN enderecos e
ON h.endereco_id = e.endereco_id
JOIN regioes_geograficas r
ON e.estado = r.estado
GROUP BY r.regiao, MES
ORDER BY MES DESC;

SELECT
    r.regiao,
	r.estado,
    AVG(preco_total / datediff(data_fim, data_inicio)) AS DIARIA_MEDIA,
    MAX(preco_total / datediff(data_fim, data_inicio)) AS DIARIA_MAXIMA,
    MIN(preco_total / datediff(data_fim, data_inicio)) AS DIARIA_MINIMA,
    AVG(datediff(data_fim, data_inicio)) AS MEDIA_DIAS,
    #SUM(preco_total / datediff(data_fim, data_inicio)) AS Faturamento,
	MONTH(a.data_inicio) AS MES,
	YEAR(a.data_inicio) AS ANO
FROM
alugueis a
JOIN hospedagens h
ON a.hospedagem_id = h.hospedagem_id
JOIN enderecos e
ON h.endereco_id = e.endereco_id
JOIN regioes_geograficas r
ON e.estado = r.estado
GROUP BY r.regiao, r.estado, MES, ANO
HAVING r.regiao = "Sul"
ORDER BY ANO, MES DESC;


SELECT
    r.regiao,
	r.estado,    
    ROUND((SUM(DATEDIFF(a.data_fim, a.data_inicio)) /
		(DATEDIFF(MAX(a.data_fim), MIN(a.data_inicio)) *
		COUNT(DISTINCT h.hospedagem_id))) * 100, 2) AS TAXA_OCUPACAO,
    AVG(preco_total / datediff(data_fim, data_inicio)) AS DIARIA_MEDIA,
    MAX(preco_total / datediff(data_fim, data_inicio)) AS DIARIA_MAXIMA,
    MIN(preco_total / datediff(data_fim, data_inicio)) AS DIARIA_MINIMA,
    AVG(datediff(data_fim, data_inicio)) AS MEDIA_DIAS,
    #SUM(preco_total / datediff(data_fim, data_inicio)) AS Faturamento,
	MONTH(a.data_inicio) AS MES,
	YEAR(a.data_inicio) AS ANO
FROM
alugueis a
JOIN hospedagens h
ON a.hospedagem_id = h.hospedagem_id
JOIN enderecos e
ON h.endereco_id = e.endereco_id
JOIN regioes_geograficas r
ON e.estado = r.estado
GROUP BY r.regiao, r.estado, MES, ANO
HAVING r.regiao = "Sul"
ORDER BY ANO, MES DESC;


SELECT
    r.regiao,
	r.estado,    
    ROUND((SUM(DATEDIFF(a.data_fim, a.data_inicio)) /
		(DATEDIFF(MAX(a.data_fim), MIN(a.data_inicio)) *
		COUNT(DISTINCT h.hospedagem_id))) * 100, 2) AS TAXA_OCUPACAO,
	COUNT(DISTINCT h.hospedagem_id) AS QTD_HOSPEDAGENS,
    DATEDIFF(MAX(a.data_fim), MIN(a.data_inicio)) * COUNT(DISTINCT h.hospedagem_id) AS DIAS_CORRIDOS_TOTAIS,
    SUM(DATEDIFF(a.data_fim, a.data_inicio)) AS DIAS_OCUPADOS,
	MONTH(a.data_inicio) AS MES,
	YEAR(a.data_inicio) AS ANO
FROM
alugueis a
JOIN hospedagens h
ON a.hospedagem_id = h.hospedagem_id
JOIN enderecos e
ON h.endereco_id = e.endereco_id
JOIN regioes_geograficas r
ON e.estado = r.estado
GROUP BY r.regiao, r.estado, MES, ANO
HAVING r.regiao = "Sul"
ORDER BY ANO, MES, ESTADO DESC;
ORDER BY ANO, MES, ESTADO DESC;