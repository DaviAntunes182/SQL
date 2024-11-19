SELECT DATA_VENDA FROM notas_fiscais ORDER BY NUMERO DESC LIMIT 1;

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
    DECLARE vNumItensNota INT;
    SELECT MAX(numero) + 1 INTO vNumeroNota FROM notas_fiscais;
    
    INSERT INTO notas_fiscais(CPF, MATRICULA, DATA_VENDA, NUMERO, IMPOSTO)
    VALUES (vCliente, vVendedor, vData, vNumeroNota, 0.10);
    SET vItens = f_aleatorio_entre(1, max_itens);
    WHILE vContador <= vItens
    DO
		SET vContador = vContador + 1;
        SET vProduto = f_produto_aleatorio();
        #SACADA DE GÊNIO, VERIFICAR SE EXISTE NA NOTA UM ÍTEM COM O CÓDIGO DO PRODUTO ACIMA(REPETIDO)
        SELECT COUNT(*) INTO vNumItensNota FROM itens_notas_fiscais
        WHERE NUMERO = vNumeroNota AND CODIGO_DO_PRODUTO = vProduto;
		IF vNumItensNota = 0 THEN
				SET vQuantidade = f_aleatorio_entre(5, max_quantidade);
			SELECT PRECO_DE_LISTA INTO vPreco FROM tabela_de_produtos WHERE CODIGO_DO_PRODUTO = vProduto;
			
			INSERT INTO itens_notas_fiscais(NUMERO, CODIGO_DO_PRODUTO, QUANTIDADE, PRECO)
			VALUES(vNumeroNota, vProduto, vQuantidade, vPreco);
		END IF;
    END WHILE;
END$$
DELIMITER ;

CALL incluindo_venda_aleatoria(10, 30);