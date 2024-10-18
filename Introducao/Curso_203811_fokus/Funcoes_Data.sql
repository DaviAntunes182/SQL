SELECT
	L.id_Colaborador,
    date_format(L.datainicio, '%Y/%m') AS 'Inicio Licença'
FROM
	Licencas L;
    
SELECT
	H.id_Colaborador,
    datediff(H.datatermino, datacontratacao),
    date(now()),
    time(now()),
    current_timestamp()
FROM
	HistoricoEmprego H
WHERE datatermino is not null;
