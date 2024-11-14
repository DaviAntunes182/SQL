CREATE SCHEMA curso_201222_dml;

CREATE TABLE IF NOT EXISTS TB_PRODUTOS(
	cod_produto INT NOT NULL AUTO_INCREMENT,
    descritor VARCHAR(100),
    sabor VARCHAR(50),
    tamanho VARCHAR(50),
    embalagem VARCHAR(50),
    preco_lista DECIMAL(6,2),
    PRIMARY KEY (cod_produto)
);

CREATE TABLE TB_VENDEDORES(
	matricula INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100),
    bairro VARCHAR(100),
    comissao FLOAT,
    data_admissao DATE,
    ferias BIT(1),
    PRIMARY KEY (matricula)
);

CREATE TABLE TB_CLIENTES(
	cpf VARCHAR(11) NOT NULL,
    nome VARCHAR(100),
    endereco VARCHAR(100),
    bairro VARCHAR(100),
    cidade VARCHAR(50),
    estado VARCHAR(50),
    cep VARCHAR(8),
    data_nascimento DATE,
    idade INT,
    sexo VARCHAR(1),
    limite_credito FLOAT,
    volume_compra FLOAT,
    primeira_compra BIT(1),
    PRIMARY KEY (CPF)
);

CREATE TABLE TB_VENDAS(
	numero INT NOT NULL AUTO_INCREMENT,
    data_venda DATE,
    cpf VARCHAR(11),
	matricula INT NOT NULL,
    comissao FLOAT,
    PRIMARY KEY (numero)
);

ALTER TABLE TB_VENDAS ADD CONSTRAINT tbvendas_clientes_fk
FOREIGN KEY (cpf) REFERENCES TB_CLIENTES (cpf);

ALTER TABLE TB_VENDAS ADD CONSTRAINT tbvendas_vendedores_fk
FOREIGN KEY (matricula) REFERENCES TB_VENDEDORES (matricula);

CREATE TABLE TB_ITENS_VENDAS(
	numero INT NOT NULL,
    cod_produto INT NOT NULL,
    quantidade INT,
    preco FLOAT,
    PRIMARY KEY(numero, cod_produto)
);

ALTER TABLE TB_ITENS_VENDAS ADD CONSTRAINT tbitensvendas_notas_fk
FOREIGN KEY (numero) REFERENCES TB_VENDAS(numero);

ALTER TABLE TB_ITENS_VENDAS ADD CONSTRAINT tbitensvendas_produtos_fk
FOREIGN KEY (cod_produto) REFERENCES TB_PRODUTOS(cod_produto);

ALTER TABLE TB_ITENS_VENDAS DROP CONSTRAINT tbitensvendas_produtos_fk;
