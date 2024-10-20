CREATE TABLE Professores (
    ID_Professor INT PRIMARY KEY,
    Nome_Professor VARCHAR(255),
    Data_Nascimento DATE,
    Genero VARCHAR(50),
    Telefone_Contato VARCHAR(20),
    Email VARCHAR(255)
);

iNSERT INTO Professores 
VALUES
(1,'Ana Oliveira','1980-05-25','Feminino','(11) 1234-5678','ana@email.com'),
(2,'Carlos Ferreira','1975-09-12','Masculino','(11) 2345-6789','carlos@email.com'),
(3,'Mariana Santos','1982-03-15','Feminino','(11) 3456-7890','mariana@email.com'),
(4,'Ricardo Silva','1978-08-20','Masculino','(11) 7890-1234','ricardo@email.com'),
(5,'Fernanda Lima','1985-01-30','Feminino','(11) 4567-8901','fernanda@email.com');
