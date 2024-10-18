SELECT 
	min(faturamento_bruto) AS 'Menor Faturamento' 
FROM 
	faturamento;

SELECT * FROM faturamento
WHERE faturamento_bruto = (SELECT max(faturamento_bruto) FROM faturamento);

SELECT * FROM faturamento
WHERE faturamento_bruto = (SELECT min(faturamento_bruto) FROM faturamento);

SELECT SUM(f.numero_novos_clientes) AS 'Novos Clientes 2023' FROM faturamento f
WHERE mes LIKE "%2023";

SELECT AVG(despesas) FROM faturamento;

SELECT AVG(lucro_liquido) FROM faturamento;

SELECT 
	COUNT(*) 
FROM 
	HistoricoEmprego
WHERE DataTermino IS NOT NULL;

