CREATE TABLE Turma_Disciplinas (
    ID_Turma INT,
    ID_Disciplina INT,
    PRIMARY KEY (ID_Turma, ID_Disciplina),
    FOREIGN KEY (ID_Turma) REFERENCES Turmas(ID_Turma),
    FOREIGN KEY (ID_Disciplina) REFERENCES Disciplinas(ID_Disciplina)
);

INSERT INTO Turma_Disciplinas
VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(1,3),
(2,1),
(3,2);