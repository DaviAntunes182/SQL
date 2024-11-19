USE `sucos_vendas`;
DROP procedure IF EXISTS `incluindo_venda_aleatoria`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `incluindo_venda_aleatoria` (max_itens INT, max_quantidade INT)
BEGIN
	DECLARE vData DATE DEFAULT CURDATE();
	DECLARE vCliente VARCHAR(11) DEFAULT f_cliente_aleatorio();
	DECLARE vProduto VARCHAR(10) DEFAULT f_produto_aleatorio();
	DECLARE vVendedor VARCHAR(5) DEFAULT f_vendedor_aleatorio();
    DECLARE vPreco DECIMAL(6,2);
    DECLARE vQuantidade INT;
    DECLARE vItens INT;
    DECLARE vNumeroNota INT;
    DECLARE vContador INT DEFAULT 1;
    SELECT MAX(numero) + 1 INTO vNumeroNota FROM notas_fiscais;
    
    INSERT INTO notas_fiscais(CPF, MATRICULA, DATA_VENDA, NUMERO, IMPOSTO)
    VALUES (vCliente, vVendedor, vData, vNumeroNota, 0.10);
    SET vItens = f_aleatorio_entre(1, max_itens);
    WHILE vContador <= vItens
    DO
		SET vContador = vContador + 1;
        SET vProduto = f_produto_aleatorio();
        SET vQuantidade = f_aleatorio_entre(5, max_quantidade);
		SELECT PRECO_DE_LISTA INTO vPreco FROM tabela_de_produtos WHERE CODIGO_DO_PRODUTO = vProduto;
        
        INSERT INTO itens_notas_fiscais(NUMERO, CODIGO_DO_PRODUTO, QUANTIDADE, PRECO)
        VALUES(vNumeroNota, vProduto, vQuantidade, vPreco);
    END WHILE;
END$$
DELIMITER ;

CALL incluindo_venda_aleatoria(3, 100);

USE `sucos_vendas`;
DROP FUNCTION IF EXISTS `f_cliente_index_aleatorio`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE FUNCTION  `f_cliente_index_aleatorio`()
RETURNS INTEGER
NOT DETERMINISTIC
READS SQL DATA
BEGIN
RETURN f_aleatorio_max((SELECT COUNT(*) FROM tabela_de_clientes));
END$$
DELIMITER ;

USE `sucos_vendas`;
DROP FUNCTION IF EXISTS `f_cliente_aleatorio`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE FUNCTION  `f_cliente_aleatorio`()
RETURNS VARCHAR(11)
DETERMINISTIC
BEGIN
	DECLARE vRetorno VARCHAR(11);
    #O INDEX VEM CERTO PORÉM DEVEMOS DIMINUTIR 1 POR CAUSA DA ESTRUTURA DO LIMIT 
    DECLARE vIndex INT DEFAULT (f_cliente_index_aleatorio() - 1);
    #OBSERVANDO UMA NOVA FUNCIONALIDADE DO COMANDO LIMIT
    SELECT CPF FROM tabela_de_clientes LIMIT vIndex, 1 INTO vRetorno;
RETURN vRetorno;
END$$
DELIMITER ;

USE `sucos_vendas`;
DROP FUNCTION IF EXISTS `f_produto_index_aleatorio`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE FUNCTION  `f_produto_index_aleatorio`()
RETURNS INTEGER
NOT DETERMINISTIC
READS SQL DATA
BEGIN
RETURN f_aleatorio_max((SELECT COUNT(*) FROM tabela_de_produtos));
END$$
DELIMITER ;

USE `sucos_vendas`;
DROP FUNCTION IF EXISTS `f_produto_aleatorio`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE FUNCTION  `f_produto_aleatorio`()
RETURNS VARCHAR(11)
DETERMINISTIC
BEGIN
	DECLARE vRetorno VARCHAR(11);
    #O INDEX VEM CERTO PORÉM DEVEMOS DIMINUTIR 1 POR CAUSA DA ESTRUTURA DO LIMIT 
    DECLARE vIndex INT DEFAULT (f_produto_index_aleatorio() - 1);
    #OBSERVANDO UMA NOVA FUNCIONALIDADE DO COMANDO LIMIT
    SELECT CODIGO_DO_PRODUTO FROM tabela_de_produtos LIMIT vIndex, 1 INTO vRetorno;
RETURN vRetorno;
END$$
DELIMITER ;

USE `sucos_vendas`;
DROP FUNCTION IF EXISTS `f_vendedor_index_aleatorio`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE FUNCTION  `f_vendedor_index_aleatorio`()
RETURNS INTEGER
NOT DETERMINISTIC
READS SQL DATA
BEGIN
RETURN f_aleatorio_max((SELECT COUNT(*) FROM tabela_de_vendedores));
END$$
DELIMITER ;

USE `sucos_vendas`;
DROP FUNCTION IF EXISTS `f_vendedor_aleatorio`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE FUNCTION  `f_vendedor_aleatorio`()
RETURNS VARCHAR(11)
DETERMINISTIC
BEGIN
	DECLARE vRetorno VARCHAR(11);
    #O INDEX VEM CERTO PORÉM DEVEMOS DIMINUTIR 1 POR CAUSA DA ESTRUTURA DO LIMIT 
    DECLARE vIndex INT DEFAULT (f_vendedor_index_aleatorio() - 1);
    #OBSERVANDO UMA NOVA FUNCIONALIDADE DO COMANDO LIMIT
    SELECT MATRICULA FROM tabela_de_vendedores LIMIT vIndex, 1 INTO vRetorno;
RETURN vRetorno;
END$$
DELIMITER ;

USE `sucos_vendas`;
DROP FUNCTION IF EXISTS `f_aleatorio_max`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE FUNCTION  `f_aleatorio_max`(maxi INT)
RETURNS INTEGER
NOT DETERMINISTIC
READS SQL DATA
BEGIN
RETURN FLOOR(RAND() *  (maxi) + 1);
END$$
DELIMITER ;


USE `sucos_vendas`;
DROP FUNCTION IF EXISTS `f_aleatorio_entre`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE FUNCTION  `f_aleatorio_entre`(mini INT, maxi INT)
RETURNS INTEGER
NOT DETERMINISTIC
READS SQL DATA
BEGIN
RETURN FLOOR((RAND() *  (maxi - mini + 1) + mini));
END$$
DELIMITER ;

SELECT f_cliente_index_aleatorio();
SELECT f_cliente_aleatorio();
SELECT f_produto_index_aleatorio();
SELECT f_produto_aleatorio();
SELECT f_vendedor_index_aleatorio();
SELECT f_vendedor_aleatorio();
SELECT f_aleatorio_entre(1, 5);
SELECT f_aleatorio_max(2);
SELECT FLOOR(RAND() *  (10 - 8 + 1) + 8);
SELECT FLOOR((RAND() * (SELECT COUNT(*) FROM tabela_de_vendedores) + 1));