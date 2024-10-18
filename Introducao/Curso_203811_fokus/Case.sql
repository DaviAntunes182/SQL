SELECT
	H.ID_Colaborador,
    H.Cargo,
    H.Salario,
    CASE
		WHEN H.salario < 3000 THEN 'Baixo'
		WHEN H.salario BETWEEN 3000 AND 6000 THEN 'Médio'
		ELSE 'Alto'
    END AS categoria_salario
FROM
	HistoricoEmprego H;