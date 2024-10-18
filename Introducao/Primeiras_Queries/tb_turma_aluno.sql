drop table turma_aluno;

create table tb_turma_aluno(
	id_turma_aluno int primary key,
	id_turma int,
    id_aluno int,
	CONSTRAINT fk_turma_aluno01 FOREIGN KEY (id_turma) REFERENCES tb_turmas(id_turma),
    CONSTRAINT fk_turma_aluno02 FOREIGN KEY (id_aluno) REFERENCES tb_alunos(id_aluno)
);

INSERT INTO tb_turma_aluno
VALUES
(1, 1,	1),
(2, 2,	2),
(3, 3,	3),
(4, 4,	4),
(5, 5,	5),
(6, 1,	6),
(7, 2,	7),
(8, 3,	8),
(9, 4,	9),
(10, 5,	10);