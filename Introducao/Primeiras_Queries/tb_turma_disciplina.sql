create table tb_turma_disciplina(
	id_turma_disciplina int primary key,
    id_turma int,
    id_disciplina int,
	CONSTRAINT fk_turma_disciplina01 FOREIGN KEY (id_turma) REFERENCES tb_turmas(id_turma),
	CONSTRAINT fk_turma_disciplina02 FOREIGN KEY (id_disciplina) REFERENCES tb_disciplinas(id_disciplina)
);

INSERT INTO tb_turma_disciplina
VALUES
(1, 1,	1),
(2, 2,	2),
(3, 3,	3),
(4, 4,	4),
(5, 5,	5),
(6, 1,	3),
(7, 2,	1),
(8, 3,	2);
