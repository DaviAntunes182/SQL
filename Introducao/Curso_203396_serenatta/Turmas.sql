CREATE TABLE Turmas (
    ID_Turma INT PRIMARY KEY,
    Nome_Turma VARCHAR(255),
    Ano_Letivo INT,
    ID_Professor_Orientador INT,
    FOREIGN KEY (ID_Professor_Orientador) REFERENCES Professores(ID_Professor)
);

INSERT INTO Turmas
VALUES
(1,'Turma A',2023,1),
(2,'Turma B',2023,2),
(3,'Turma C',2023,3),
(4,'Turma D',2023,4),
(5,'Turma E',2023,5);