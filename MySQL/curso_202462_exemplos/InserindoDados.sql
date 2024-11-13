ALTER TABLE TB_ESTOQUE ADD CONSTRAINT estoque_fk_livros
FOREIGN KEY (ID_LIVRO) REFERENCES TB_LIVROS (ID_LIVRO)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
# AS DUAS ÚLTIMAS LINHAS GARANTEM UM ERRO NA ALTERAÇÃO DE ALGUM LIVRO
# QUE EXISTA EM ESTOQUE MAS NÃO EXISTA EM LIVROS


SET FOREIGN_KEY_CHECKS = 0;
#Está linha ignora as contraints de fk
#20:43:46	INSERT INTO TB_ESTOQUE  VALUES (1,  7), (2,  10), (3,  2), (8,  4), (10, 5), (11, 3), (12, 3)	Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`curso_202462_livraria`.`TB_ESTOQUE`, CONSTRAINT `estoque_fk_livros` FOREIGN KEY (`ID_LIVRO`) REFERENCES `TB_LIVROS` (`ID_LIVRO`))	0.010 sec


INSERT INTO TB_LIVROS
VALUES(1, 'Percy Jackson e o Ladrão de Raios', 'Rick Riordan', 'Intrínseca', 'Aventura', 34.65);

INSERT INTO TB_LIVROS
VALUES(2, 'Volta ao Mundo em 80 Dias', 'Julio Verne', 'Principis', 'Aventura', 21.99),
(3, 'O Cortiço', 'Aluísio de Azevedo','Panda Books', 'Romance', 47.8),
(4,'Dom Casmurro', 'Machado de Assis','Via Leitura', 'Romance', 19.90),
(5,'Memórias Póstumas de Brás Cubas', 'Machado de Assis','Antofágica','Romance', 45),
(6,'Quincas Borba','Machado de Assis', 'L&PM Editores', 'Romance', 48.5),
(7,'Ícaro','Gabriel Pedrosa',  'Ateliê','Poesia', 36),
(8,'Os Lusíadas', 'Luís Vaz de Camões',  'Montecristo','Poesia', 18.79),
(9,'Outros Jeitos de Usar a Boca', 'Rupi Kaur', 'Planeta','Poesia', 34.8);

INSERT INTO TB_VENDEDORES 
VALUES
(1,'Paula Rabelo'),
(2,'Juliana Macedo'),
(3,'Roberto Barros'),
(4,'Barbara Jales');

INSERT INTO TB_VENDAS 
VALUES 
(1, 3, 7, 1, '2020-11-02'),
(2, 4, 8, 2, '2020-11-02'),
(3, 4, 4, 3, '2020-11-02'),
(4, 1, 7, 1, '2020-11-03'),
(5, 1, 6, 3, '2020-11-03'),
(6, 1, 9, 2, '2020-11-04'),
(7, 4, 1, 3, '2020-11-04'),
(8, 1, 5, 2, '2020-11-05'),
(9, 1, 2, 1, '2020-11-05'),
(10, 3, 8, 2, '2020-11-11'),
(11, 1, 1, 4, '2020-11-11'),
(12, 2, 10, 10, '2020-11-11'),
(13, 1, 12, 5, '2020-11-18'),
(14, 2, 4, 1, '2020-11-25'),
(15, 3, 13, 2,'2021-01-05'),
(16, 4, 13, 1, '2021-01-05'),
(17, 4, 4, 3, '2021-01-06'),
(18, 2, 12, 2, '2021-01-06');

INSERT INTO TB_ESTOQUE 
VALUES
(1,  7),
(2,  10),
(3,  2),
(8,  4),
(10, 5),
(11, 3),
(12, 3);

