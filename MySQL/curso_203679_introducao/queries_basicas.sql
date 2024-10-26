SELECT 
	p.nome,
	count(h.hospedagem_id) AS Propriedades
FROM 
	proprietarios p
INNER JOIN hospedagens h
ON p.proprietario_id = h.proprietario_id
WHERE h.ativo = 1
GROUP BY p.nome
ORDER BY Propriedades DESC
LIMIT 10;

SELECT
	p.nome,
    COUNT(
		CASE h.ativo
			WHEN 1 THEN h.ativo
		END) AS ativo
FROM
	proprietarios p
INNER JOIN hospedagens h
ON p.proprietario_id = h.proprietario_id
GROUP BY p.nome
ORDER BY ativo DESC
LIMIT 10;

SELECT 
	p.nome,
	count(h.hospedagem_id) AS Propriedades
FROM 
	proprietarios p
INNER JOIN hospedagens h
ON p.proprietario_id = h.proprietario_id
WHERE h.ativo = 0
GROUP BY p.nome
ORDER BY Propriedades DESC
LIMIT 10;

