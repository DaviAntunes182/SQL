USE curso_203811_alura;

SELECT * FROM HistoricoEmprego
WHERE DataTermino is null
ORDER BY salario DESC
LIMIT 5;

SELECT * FROM Treinamento
WHERE curso LIKE '%realizar%';


SELECT * FROM Colaboradores
WHERE nome LIKE "Isadora%";

SELECT * FROM HistoricoEmprego
WHERE cargo = "Professor" AND datatermino IS NOT NULL;

SELECT * FROM HistoricoEmprego
WHERE cargo = "Oftalmologista" OR cargo = "Dermatologista";

SELECT * FROM HistoricoEmprego
WHERE cargo IN ("Oftalmologista", "Dermatologista", "Professor");

SELECT * FROM HistoricoEmprego
WHERE cargo NOT IN ("Oftalmologista", "Dermatologista", "Professor");

SELECT * FROM Treinamento
WHERE (curso LIKE "%O direito%" AND Instituicao = "da Rocha")
OR (curso LIKE "O conforto%" AND instituicao = "das Neves");
