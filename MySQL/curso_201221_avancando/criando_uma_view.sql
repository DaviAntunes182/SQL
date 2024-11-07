USE `sucos_vendas`;
CREATE  OR REPLACE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhos` 
    SQL SECURITY DEFINER
VIEW `VW_PRECO_MEDIO_EMBALAGEM` AS
    SELECT 
        `tabela_de_produtos`.`EMBALAGEM` AS `EMBALAGEM`,
        AVG(`tabela_de_produtos`.`PRECO_DE_LISTA`) AS `PRECO_MEDIO`
    FROM
        `tabela_de_produtos`
    GROUP BY `tabela_de_produtos`.`EMBALAGEM`;

SELECT 
	a.NOME_DO_PRODUTO,
    a.PRECO_DE_LISTA,
	x.EMBALAGEM, 
    ROUND(x.PRECO_MEDIO, 2) AS MEDIA_CATEGORIA,
    CONCAT(ROUND(((a.PRECO_DE_LISTA / x.PRECO_MEDIO) -1) * 100, 2), '%') AS DIFERENÇA
FROM tabela_de_produtos a
INNER JOIN VW_PRECO_MEDIO_EMBALAGEM x
ON a.EMBALAGEM = x.EMBALAGEM;

