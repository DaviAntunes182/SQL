#Tamanho de uma String
SELECT
	C.Nome,
    length(C.CPF) AS Qtd
FROM
	Colaboradores C
WHERE length(C.CPF) = 11;

SELECT 
	COUNT(*),
	LENGTH(CPF) 
FROM 
	Colaboradores 
WHERE LENGTH(CPF) = 11
GROUP BY LENGTH(CPF);
 
#Concatenar - upper - lower
SELECT
	upper(concat("A pessoa colaboradora ", C.Nome , " de CPF ", C.CPF, " possui o seguinte endereço: ", C.Endereco) AS Texto)
FROM
	Colaboradores C;

#SUBSTR -> SUBSTRING
SELECT
	substr(C.Nome,1, 5)
FROM 
	Colaboradores C;

#REPLACE
SELECT
	REPLACE(C.Nome)
FROM 
	Colaboradores C;
    
#INSTR -> CHARINDEX
SELECT
	instr(C.Nome, "a")
FROM 
	Colaboradores C;

#CAST    
SELECT
	CONCAT('O faturamento bruto médio foi ', CAST(ROUND(AVG(faturamento_bruto),2) AS CHAR))
FROM faturamento f;