CREATE TABLE tb_disciplinas(
	id_disciplina int primary key,
    nome_disciplina varchar(50),
    descricao varchar(200),
    carga_horaria int,
    id_professor int,
    CONSTRAINT fk_disciplinas FOREIGN KEY (id_professor) REFERENCES tb_professores(id_professor)
);

INSERT INTO tb_disciplinas
VALUES
(1,	'Matemática',	'Estudo de conceitos matemáticos avançados',	60,	1),
(2,	'História',	'História mundial e local',	45,	2),
(3,	'Física',	'Princípios fundamentais da física',	60,	1),
(4,	'Química',	'Estudo da química e suas aplicações',	45,	3),
(5,	'Inglês',	'Aulas de inglês para iniciantes',	45,	4),
(6,	'Artes',	'Exploração da criatividade artística',	30,	5);

SELECT 
	d.nome_disciplina,
    d.carga_horaria,
    p.nome_professor
FROM
	tb_disciplinas d
INNER JOIN
	tb_professores p
ON d.id_professor = p.id_professor;