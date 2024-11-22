CREATE VIEW VW_METRICAS_POR_REGIAO AS 
SELECT
    r.regiao,
    AVG(preco_total / datediff(data_fim, data_inicio)) AS DIARIA_MEDIA,
    MAX(preco_total / datediff(data_fim, data_inicio)) AS DIARIA_MAXIMA,
    MIN(preco_total / datediff(data_fim, data_inicio)) AS DIARIA_MINIMA,
    AVG(datediff(data_fim, data_inicio)) AS MEDIA_ESTADIA
FROM
alugueis a
JOIN hospedagens h
ON a.hospedagem_id = h.hospedagem_id
JOIN enderecos e
ON h.endereco_id = e.endereco_id
JOIN regioes_geograficas r
ON e.estado = r.estado
GROUP BY r.regiao;

DROP VIEW VW_METRICAS_REGIONAIS_TEMPORAIS;
CREATE VIEW VW_METRICAS_REGIONAIS_TEMPORAIS AS
SELECT
    r.regiao AS REGIAO,
    ROUND(AVG(preco_total / datediff(data_fim, data_inicio)),2) AS DIARIA_MEDIA,
    ROUND(AVG(datediff(data_fim, data_inicio)), 1) AS MEDIA_DIAS,
    MONTH(a.data_inicio) AS MES,
	YEAR(a.data_inicio) AS ANO,
	COUNT(*) AS TOTAL_ALUGUEIS
FROM
alugueis a
JOIN hospedagens h
ON a.hospedagem_id = h.hospedagem_id
JOIN enderecos e
ON h.endereco_id = e.endereco_id
JOIN regioes_geograficas r
ON e.estado = r.estado
GROUP BY r.regiao, MES, ANO
ORDER BY ANO, MES DESC;


SELECT * FROM VW_METRICAS_POR_REGIAO;
SELECT * FROM VW_METRICAS_REGIONAIS_TEMPORAIS;
SELECT * FROM VW_METRICAS_REGIONAIS_TEMPORAIS WHERE REGIAO = 'Sudeste' AND ANO = 2023;

SELECT
	REGIAO,
    SUM(TOTAL_ALUGUEIS),
    (SELECT REGIAO FROM VW_METRICAS_REGIONAIS_TEMPORAIS GROUP BY REGIAO ORDER BY SUM(TOTAL_ALUGUEIS) DESC LIMIT 1) AS REGIAO_MAIS_ALUGADA
FROM
	VW_METRICAS_REGIONAIS_TEMPORAIS
GROUP BY REGIAO;
