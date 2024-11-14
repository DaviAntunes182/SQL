START TRANSACTION;

UPDATE vendedores SET comissao = comissao * 1.15;

SELECT * FROM vendedores;

ROLLBACK;
COMMIT;