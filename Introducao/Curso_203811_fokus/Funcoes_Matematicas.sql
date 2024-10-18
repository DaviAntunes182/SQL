SELECT
	AVG(f.faturamento_bruto),
    ROUND(AVG(f.faturamento_bruto), 2)
FROM
	faturamento f;

SELECT
	CEIL(f.faturamento_bruto),
	CEIL(f.despesas),
	FLOOR(f.faturamento_bruto),
	FLOOR(f.despesas)
FROM
	faturamento f;