DROP TABLE tb_turmas;

CREATE TABLE tb_turmas(
	id_turma int primary key,
    nome_turma varchar(10),
    ano_letivo varchar(4),
    id_professor_orientador int,
    CONSTRAINT fk_turmas FOREIGN KEY (id_professor_orientador) REFERENCES tb_professores(id_professor)
);

INSERT INTO tb_turmas
VALUES 
(1,	'Turma A',	'2023',	'1'),
(2,	'Turma B',	'2023',	'2'),
(3,	'Turma C',	'2023',	'3'),
(4,	'Turma D',	'2023',	'4'),
(5,	'Turma E',	'2023',	'5');
