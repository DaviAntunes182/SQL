USE `sucos_vendas`;
DROP procedure IF EXISTS `aleatorio`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `aleatorio` ()
BEGIN
	SELECT ROUND(RAND() * 10);
END$$
DELIMITER ;

USE `sucos_vendas`;
DROP procedure IF EXISTS `aleatorio`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `aleatorio` ()
BEGIN
	DECLARE vData1, vData2 DATE;
	DECLARE vRandom1, vRandom2, vRandom3 INT DEFAULT 0;
    SET vRandom1 = (SELECT ROUND(RAND() * 10));
    SET vRandom2 = (SELECT ROUND(RAND() * 10));
    SET vRandom3 = (SELECT ROUND(RAND() * 10 + 2020));
    SET vData1 = DATE_ADD(DATE_ADD(MAKEDATE(vRandom3, 1), INTERVAL(vRandom2 - 1) MONTH), INTERVAL(vRandom1 - 1) DAY);
    SET vData2 = DATE_ADD(DATE_ADD(MAKEDATE(vRandom3, 1), INTERVAL(vRandom1 - 1) MONTH), INTERVAL(vRandom2 - 1) DAY);
    SELECT vRandom1, vRandom2, vRandom3, vData1, vData2;
    
END$$
DELIMITER ;


CALL aleatorio();