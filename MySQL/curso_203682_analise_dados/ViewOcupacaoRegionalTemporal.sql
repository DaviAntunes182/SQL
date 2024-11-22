CREATE VIEW VW_OCUPACAO_REGIONAL_TEMPORAL AS
SELECT 
	R.regiao AS REGIAO,
    ROUND((SUM(DATEDIFF(A.data_fim, A.data_inicio)) /
			(DATEDIFF(MAX(A.data_fim), MIN(A.data_inicio)) *
			COUNT(DISTINCT H.hospedagem_id))) * 100, 2) AS TAXA_OCUPACAO,
	YEAR(A.data_inicio) AS ANO,
	MONTH(A.data_inicio) AS MES
FROM
	alugueis A
INNER JOIN hospedagens H
ON A.hospedagem_id = H.hospedagem_id
INNER JOIN enderecos E
ON H.endereco_id = E.endereco_id
INNER JOIN regioes_geograficas R
ON E.estado = R.estado
GROUP BY REGIAO, ANO, MES;

USE `insightplaces`;
DROP procedure IF EXISTS `get_ocupacao_regional_temporal`;

DELIMITER $$
USE `insightplaces`$$
CREATE PROCEDURE `get_ocupacao_regional_temporal` (vRegiao VARCHAR(50))
BEGIN
	SELECT 
		R.regiao AS REGIAO,
		ROUND((SUM(DATEDIFF(A.data_fim, A.data_inicio)) /
				(DATEDIFF(MAX(A.data_fim), MIN(A.data_inicio)) *
				COUNT(DISTINCT H.hospedagem_id))) * 100, 2) AS TAXA_OCUPACAO,
		YEAR(A.data_inicio) AS ANO,
		MONTH(A.data_inicio) AS MES
	FROM
		alugueis A
	INNER JOIN hospedagens H
	ON A.hospedagem_id = H.hospedagem_id
	INNER JOIN enderecos E
	ON H.endereco_id = E.endereco_id
	INNER JOIN regioes_geograficas R
	ON E.estado = R.estado
	GROUP BY REGIAO, ANO, MES
    HAVING REGIAO = vRegiao
    ORDER BY ANO, MES;
END$$

DELIMITER ;

CALL get_ocupacao_regional_temporal('Sudeste');