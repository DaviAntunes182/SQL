CREATE TABLE tb_professores (
	id_professor int primary key,
    nome_professor varchar(100),
    data_nascimento DATE,
    genero varchar(1),
    telefone_contato varchar(14),
    email varchar(100)
);

INSERT INTO tb_professores
VALUES 
(1,	'Ana Oliveira',	'	1980-05-25	',	'F',	'(11) 1234-5678',	'ana@email.com'),
(2,	'Carlos Ferreira',	'	1975-09-12	',	'M',	'(11) 2345-6789',	'carlos@email.com'),
(3,	'Mariana Santos',	'	1982-03-15	',	'F',	'(11) 3456-7890',	'mariana@email.com'),
(4,	'Ricardo Silva',	'	1978-08-20	',	'M',	'(11) 7890-1234',	'ricardo@email.com'),
(5,	'Fernanda Lima',	'	1985-01-30	',	'F',	'(11) 4567-8901',	'fernanda@email.com');
