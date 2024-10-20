CREATE TABLE Disciplinas (
    ID_Disciplina INT PRIMARY KEY,
    Nome_Disciplina VARCHAR(255),
    Descricao VARCHAR(255),
    Carga_Horaria INT,
    ID_Professor INT,
    FOREIGN KEY (ID_Professor) REFERENCES Professores(ID_Professor)
);

INSERT INTO Disciplinas
VALUES
(1,'Matemática','Estudo de conceitos matemáticos avançados',60,1),
(2,'História','História mundial e local',45,2),
(3,'Física','Princípios fundamentais da física',60,1),
(4,'Química','Estudo da química e suas aplicações',45,3),
(5,'Inglês','Aulas de inglês para iniciantes',45,4),
(6,'Artes','Exploração da criatividade artística',30,5);
