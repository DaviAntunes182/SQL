#Union não aparece valores repetidos, devem ser os mesmos campos
SELECT 
	c.Rua,
    c.Bairro,
    c.Cidade,
    c.Estado,
    c.cep
FROM
	colaboradores c
UNION
	SELECT 
	f.Rua,
    f.Bairro,
    f.Cidade,
    f.Estado,
    f.cep
FROM
	fornecedores f;

#Union All aparece valores repetidos
SELECT 
	c.nome,
	c.Rua,
    c.Bairro,
    c.Cidade,
    c.Estado,
    c.cep
FROM
	colaboradores c
UNION ALL
	SELECT 
    f.nome,
	f.Rua,
    f.Bairro,
    f.Cidade,
    f.Estado,
    f.cep
FROM
	fornecedores f;

