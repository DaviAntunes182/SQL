DROP TABLE Notas;

CREATE TABLE Notas (
    ID_Nota INT PRIMARY KEY,
    ID_Aluno INT,
    ID_Disciplina INT,
    Nota DECIMAL(5, 2),
    Data_Avaliacao DATE,
    FOREIGN KEY (ID_Aluno) REFERENCES Alunos(ID_Aluno),
    FOREIGN KEY (ID_Disciplina) REFERENCES Disciplinas(ID_Disciplina)
);

INSERT INTO Notas(ID_Nota,ID_Aluno,ID_Disciplina,Nota,Data_Avaliacao) VALUES (2,1,1,6.19,'2023-7-7');
INSERT INTO Notas(ID_Nota,ID_Aluno,ID_Disciplina,Nota,Data_Avaliacao) VALUES (3,2,1,7.18,'2023-7-7');
INSERT INTO Notas(ID_Nota,ID_Aluno,ID_Disciplina,Nota,Data_Avaliacao) VALUES (4,3,1,7.47,'2023-7-7');
INSERT INTO Notas(ID_Nota,ID_Aluno,ID_Disciplina,Nota,Data_Avaliacao) VALUES (5,4,1,7.46,'2023-7-7');
INSERT INTO Notas(ID_Nota,ID_Aluno,ID_Disciplina,Nota,Data_Avaliacao) VALUES (6,5,1,4.35,'2023-7-7');
INSERT INTO Notas(ID_Nota,ID_Aluno,ID_Disciplina,Nota,Data_Avaliacao) VALUES (7,6,1,4.43,'2023-7-7');
INSERT INTO Notas(ID_Nota,ID_Aluno,ID_Disciplina,Nota,Data_Avaliacao) VALUES (8,7,1,0.76,'2023-7-7');
INSERT INTO Notas(ID_Nota,ID_Aluno,ID_Disciplina,Nota,Data_Avaliacao) VALUES (9,8,1,9.22,'2023-7-7');
INSERT INTO Notas(ID_Nota,ID_Aluno,ID_Disciplina,Nota,Data_Avaliacao) VALUES (10,9,1,9.4,'2023-7-7');
INSERT INTO Notas(ID_Nota,ID_Aluno,ID_Disciplina,Nota,Data_Avaliacao) VALUES (11,10,1,3.28,'2023-7-7');
INSERT INTO Notas(ID_Nota,ID_Aluno,ID_Disciplina,Nota,Data_Avaliacao) VALUES (12,1,2,1.34,'2023-7-9');
INSERT INTO Notas(ID_Nota,ID_Aluno,ID_Disciplina,Nota,Data_Avaliacao) VALUES (13,2,2,3.01,'2023-7-9');
INSERT INTO Notas(ID_Nota,ID_Aluno,ID_Disciplina,Nota,Data_Avaliacao) VALUES (14,3,2,1.66,'2023-7-9');
INSERT INTO Notas(ID_Nota,ID_Aluno,ID_Disciplina,Nota,Data_Avaliacao) VALUES (15,4,2,0.03,'2023-7-9');
INSERT INTO Notas(ID_Nota,ID_Aluno,ID_Disciplina,Nota,Data_Avaliacao) VALUES (16,5,2,4.34,'2023-7-9');
INSERT INTO Notas(ID_Nota,ID_Aluno,ID_Disciplina,Nota,Data_Avaliacao) VALUES (17,6,2,4.02,'2023-7-9');
INSERT INTO Notas(ID_Nota,ID_Aluno,ID_Disciplina,Nota,Data_Avaliacao) VALUES (18,7,2,8.79,'2023-7-9');
INSERT INTO Notas(ID_Nota,ID_Aluno,ID_Disciplina,Nota,Data_Avaliacao) VALUES (19,8,2,1.17,'2023-7-9');
INSERT INTO Notas(ID_Nota,ID_Aluno,ID_Disciplina,Nota,Data_Avaliacao) VALUES (20,9,2,8.26,'2023-7-9');
INSERT INTO Notas(ID_Nota,ID_Aluno,ID_Disciplina,Nota,Data_Avaliacao) VALUES (21,10,2,3.41,'2023-7-9');
INSERT INTO Notas(ID_Nota,ID_Aluno,ID_Disciplina,Nota,Data_Avaliacao) VALUES (22,1,3,6.82,'2023-7-27');
INSERT INTO Notas(ID_Nota,ID_Aluno,ID_Disciplina,Nota,Data_Avaliacao) VALUES (23,2,3,8.21,'2023-7-27');
INSERT INTO Notas(ID_Nota,ID_Aluno,ID_Disciplina,Nota,Data_Avaliacao) VALUES (24,3,3,1.03,'2023-7-27');
INSERT INTO Notas(ID_Nota,ID_Aluno,ID_Disciplina,Nota,Data_Avaliacao) VALUES (25,4,3,4.1,'2023-7-27');
INSERT INTO Notas(ID_Nota,ID_Aluno,ID_Disciplina,Nota,Data_Avaliacao) VALUES (26,5,3,0.25,'2023-7-27');
INSERT INTO Notas(ID_Nota,ID_Aluno,ID_Disciplina,Nota,Data_Avaliacao) VALUES (27,6,3,6.63,'2023-7-27');
INSERT INTO Notas(ID_Nota,ID_Aluno,ID_Disciplina,Nota,Data_Avaliacao) VALUES (28,7,3,9.74,'2023-7-27');
INSERT INTO Notas(ID_Nota,ID_Aluno,ID_Disciplina,Nota,Data_Avaliacao) VALUES (29,8,3,3.77,'2023-7-27');
INSERT INTO Notas(ID_Nota,ID_Aluno,ID_Disciplina,Nota,Data_Avaliacao) VALUES (30,9,3,0.58,'2023-7-27');
INSERT INTO Notas(ID_Nota,ID_Aluno,ID_Disciplina,Nota,Data_Avaliacao) VALUES (31,10,3,8.52,'2023-7-27');
INSERT INTO Notas(ID_Nota,ID_Aluno,ID_Disciplina,Nota,Data_Avaliacao) VALUES (32,1,4,8.37,'2023-8-8');
INSERT INTO Notas(ID_Nota,ID_Aluno,ID_Disciplina,Nota,Data_Avaliacao) VALUES (33,2,4,0.26,'2023-8-8');
INSERT INTO Notas(ID_Nota,ID_Aluno,ID_Disciplina,Nota,Data_Avaliacao) VALUES (34,3,4,5.95,'2023-8-8');
INSERT INTO Notas(ID_Nota,ID_Aluno,ID_Disciplina,Nota,Data_Avaliacao) VALUES (35,4,4,6.98,'2023-8-8');
INSERT INTO Notas(ID_Nota,ID_Aluno,ID_Disciplina,Nota,Data_Avaliacao) VALUES (36,5,4,6.18,'2023-8-8');
INSERT INTO Notas(ID_Nota,ID_Aluno,ID_Disciplina,Nota,Data_Avaliacao) VALUES (37,6,4,4.79,'2023-8-8');
INSERT INTO Notas(ID_Nota,ID_Aluno,ID_Disciplina,Nota,Data_Avaliacao) VALUES (38,7,4,7.96,'2023-8-8');
INSERT INTO Notas(ID_Nota,ID_Aluno,ID_Disciplina,Nota,Data_Avaliacao) VALUES (39,8,4,0.62,'2023-8-8');
INSERT INTO Notas(ID_Nota,ID_Aluno,ID_Disciplina,Nota,Data_Avaliacao) VALUES (40,9,4,7.77,'2023-8-8');
INSERT INTO Notas(ID_Nota,ID_Aluno,ID_Disciplina,Nota,Data_Avaliacao) VALUES (41,10,4,5.81,'2023-8-8');
INSERT INTO Notas(ID_Nota,ID_Aluno,ID_Disciplina,Nota,Data_Avaliacao) VALUES (42,1,5,2.25,'2023-8-15');
INSERT INTO Notas(ID_Nota,ID_Aluno,ID_Disciplina,Nota,Data_Avaliacao) VALUES (43,2,5,5.82,'2023-8-15');
INSERT INTO Notas(ID_Nota,ID_Aluno,ID_Disciplina,Nota,Data_Avaliacao) VALUES (44,3,5,4.11,'2023-8-15');
INSERT INTO Notas(ID_Nota,ID_Aluno,ID_Disciplina,Nota,Data_Avaliacao) VALUES (45,4,5,7.99,'2023-8-15');
INSERT INTO Notas(ID_Nota,ID_Aluno,ID_Disciplina,Nota,Data_Avaliacao) VALUES (46,5,5,3.23,'2023-8-15');
INSERT INTO Notas(ID_Nota,ID_Aluno,ID_Disciplina,Nota,Data_Avaliacao) VALUES (47,6,5,8.09,'2023-8-15');
INSERT INTO Notas(ID_Nota,ID_Aluno,ID_Disciplina,Nota,Data_Avaliacao) VALUES (48,7,5,8.24,'2023-8-15');
INSERT INTO Notas(ID_Nota,ID_Aluno,ID_Disciplina,Nota,Data_Avaliacao) VALUES (49,8,5,3.33,'2023-8-15');
INSERT INTO Notas(ID_Nota,ID_Aluno,ID_Disciplina,Nota,Data_Avaliacao) VALUES (50,9,5,4.24,'2023-8-15');
INSERT INTO Notas(ID_Nota,ID_Aluno,ID_Disciplina,Nota,Data_Avaliacao) VALUES (51,10,5,0.11,'2023-8-15');
