DELETE FROM TB_LIVROS WHERE ID_LIVRO = 8;

#tirando safe mode
SET SQL_SAFE_UPDATES = 0;

UPDATE TB_LIVROS SET PRECO = 0.9 * PRECO;

21:02:17	UPDATE TB_LIVROS SET PRECO = 0.9 * PRECO	Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.	0.00097 sec
