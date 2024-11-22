SELECT
    p.nome AS proprietario,
    ROUND(AVG(a.preco_total / DATEDIFF(a.data_fim, a.data_inicio)), 2) AS preco_medio_diario,
    ROUND((SUM(DATEDIFF(a.data_fim, a.data_inicio)) / (DATEDIFF(MAX(a.data_fim), MIN(a.data_inicio)) * COUNT(DISTINCT h.hospedagem_id))) * 100, 2) AS taxa_ocupacao
FROM
    proprietarios p
JOIN
    hospedagens h ON p.proprietario_id = h.proprietario_id
JOIN
    alugueis a ON h.hospedagem_id = a.hospedagem_id
GROUP BY
    p.proprietario_id;

SELECT
	C.nome AS proprietario,
    MIN(A.PRIMEIRO_DIA) AS PRIMEIRO_DIA,
    SUM(A.TOTAL_DIAS) AS TOTAL_DIAS,
    SUM(A.DIAS_OCUPADOS) AS DIAS_OCUPADOS,
    ROUND((SUM(A.DIAS_OCUPADOS) /SUM(A.TOTAL_DIAS)) * 100 ) AS TAXA_OCUPACAO
FROM (SELECT
	hospedagem_id,
    MIN(data_inicio) AS PRIMEIRO_DIA,
    SUM(DATEDIFF(data_fim, data_inicio)) AS DIAS_OCUPADOS,
    DATEDIFF(MAX(data_fim), MIN(data_inicio)) AS TOTAL_DIAS
FROM
	alugueis
GROUP BY
    hospedagem_id
) A
INNER JOIN hospedagens B
ON A.hospedagem_id = B.hospedagem_id
INNER JOIN proprietarios C
ON B.proprietario_id = C.proprietario_id
GROUP BY C.proprietario_id
ORDER BY TOTAL_DIAS DESC;