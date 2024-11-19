USE `sucos_vendas`;
DROP procedure IF EXISTS `looping`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `looping` (vInicio INT, vFim INT)
BEGIN
	DECLARE vContador INT DEFAULT vInicio;
    DECLARE vMsg VARCHAR(1000) DEFAULT '';
    DECLARE vMsgCount VARCHAR(1000) DEFAULT '';
	WHILE vContador <= vFim
    DO
		SET vMsg = CONCAT(vMsg, ROUND(RAND() * vFim));
        SET vMsgCount = CONCAT(vMsgCount, vContador);
        SET vContador = vContador + 1;
    END WHILE;
    SELECT vMsg, vMsgCount, LENGTH(vMsg);
END$$
DELIMITER ;

CALL looping(1, 100);