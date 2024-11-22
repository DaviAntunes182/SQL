USE `insightplaces`;
DROP procedure IF EXISTS `get_por_regiao`;

DELIMITER $$
USE `insightplaces`$$
CREATE PROCEDURE `get_analise_por_regiao_estado` (vRegiao VARCHAR(50))
BEGIN
	SELECT
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
    WHERE r.regiao = vRegiao
	GROUP BY r.estado, MES, ANO	
	ORDER BY ANO, MES DESC;
END$$

DELIMITER ;

CALL get_analise_por_regiao_estado('Norte');
