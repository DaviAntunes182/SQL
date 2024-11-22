SELECT
	YEAR(data_inicio) AS ANO,
	MONTH(data_inicio) AS MES,
    COUNT(*) AS TOTAL_ALUGUEIS,
    AVG(DATEDIFF(data_fim, data_inicio)) AS ESTADIA_MEDIA,
    SUM(preco_total) AS RECEITA_MENSAL,
    AVG(preco_total / DATEDIFF(data_fim, data_inicio)) AS DIARIA_MEDIA,
    MAX(DATEDIFF(data_fim, data_inicio)) AS ESTADIA_MAXIMA
FROM 
	alugueis
GROUP BY ANO, MES
ORDER BY ANO, MES;