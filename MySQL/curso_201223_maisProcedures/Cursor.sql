USE `sucos_vendas`;
DROP procedure IF EXISTS `cursores`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `cursores` (vFinal INT)
BEGIN
	DECLARE vContador INT DEFAULT 1;
	DECLARE vNome VARCHAR(50);
	DECLARE vNomes VARCHAR(200) DEFAULT '';
	
    DECLARE vCursor CURSOR FOR SELECT NOME FROM tabela_de_clientes LIMIT vFinal;
    #Cursores interagem linha a linha, com uma ou mais colunas.
    # DECLARADO UM CURSOR PARA A COLUNA NOME DA TABELA DE CLIENTES, LIMITADO A n NOMES, ALÉM DISSO DEVE SER A ÚLTIMA VARIÁVEL A SER DECLARADA
    OPEN vCursor;
    WHILE vContador <= vFinal
	DO 
		FETCH vCursor INTO vNome;
        SET vContador = vContador + 1;
        SELECT vNome;
        SET vNomes = CONCAT(vNomes, ' ', vNome);
    END WHILE;
	CLOSE vCursor;
    SELECT vNomes;
END$$
DELIMITER ;

CALL cursores(4);