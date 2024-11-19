USE `sucos_vendas`;
DROP procedure IF EXISTS `classifica_sabores`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `classifica_sabores` (vCod VARCHAR(11))
BEGIN
	DECLARE vResultado VARCHAR(20);
	DECLARE vSabor VARCHAR(20);
    
	SELECT SABOR INTO vSabor FROM tabela_de_produtos WHERE codigo_do_produto = vCod;
    
    CASE
		WHEN vSabor REGEXP 'Lim|Laranj|Maracu|Moran'
		THEN SET vResultado = 'Cítrico';
		WHEN vSabor LIKE 'Uva' OR vSabor LIKE '%Maça%' OR vSabor LIKE '%Açai%'
		THEN SET vResultado = 'Neutro';
		ELSE
		SET vResultado = 'Doce';
    END CASE;
    
    SELECT vResultado, vSabor;
    
END$$
DELIMITER ;

USE `sucos_vendas`;
DROP procedure IF EXISTS `classifica_sabores`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `classifica_sabores` (vCod VARCHAR(11))
BEGIN
	DECLARE vResultado VARCHAR(20);
	DECLARE vSabor VARCHAR(20);
    
	SELECT SABOR INTO vSabor FROM tabela_de_produtos WHERE codigo_do_produto = vCod;
    
    CASE vSabor
		WHEN 'Lima/Limão'
		THEN SET vResultado = 'Cítrico';
		WHEN 'Laranja'
		THEN SET vResultado = 'Cítrico';
		WHEN 'Maracuja'
		THEN SET vResultado = 'Cítrico';
		WHEN 'Morango'
		THEN SET vResultado = 'Cítrico';
		WHEN 'Uva'
		THEN SET vResultado = 'Neutro';
        WHEN 'Maça'
		THEN SET vResultado = 'Neutro';
        WHEN 'Açai'
		THEN SET vResultado = 'Neutro';
		ELSE
		SET vResultado = 'Doce';
    END CASE;
    
    SELECT vResultado, vSabor;
    
END$$
DELIMITER ;

CALL classifica_sabores('1086543');
CALL classifica_sabores('1000889');
CALL classifica_sabores('1000889');

select * from tabela_de_produtos;

select * from tabela_de_produtos where CODIGO_DO_PRODUTO = 1086543;

#Regexp é tipo uma soma de LIKE e OR
select * from tabela_de_produtos where SABOR REGEXP 'Lim|Laranj|Maracu|Moran';

/*
SELECT * FROM fiberbox WHERE field REGEXP '^1740 |1938 $|1940 (.*) test';
SELECT * FROM fiberbox WHERE field REGEXP '1740 |1938 |^9999$'
                          OR field NOT REGEXP '1940 |^test ';
lacing ^ in front of the value indicates start of the line.

Placing $ after the value indicates end of line.

Placing (.*) behaves much like the % wildcard.

The . indicates any single character, except line breaks.
Placing . inside () with * (.*) adds a repeating pattern indicating any number of characters till end of line.
*/