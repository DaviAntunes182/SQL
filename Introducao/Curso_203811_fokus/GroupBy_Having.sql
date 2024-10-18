SELECT
	Parentesco,
    COUNT(*)
FROM 
	Dependentes
GROUP BY Parentesco;

#WHERE para funções de agregação
SELECT 
	Instituicao,
    COUNT(*)
FROM 
	Treinamento
GROUP BY Instituicao
HAVING COUNT(*) > 2;

SELECT 
	h.Cargo,
	COUNT(*) AS qtd 
FROM 
	HistoricoEmprego h
GROUP BY h.Cargo
HAVING qtd >= 2;