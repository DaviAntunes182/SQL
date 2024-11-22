# As tabelas temporárias são criadas para acelerar as queries complexas que fazemos
#Tabelas criadas em disco
SHOW GLOBAL STATUS LIKE 'Created_tmp_disk_tables';

#Tabelas criadas em memória
SHOW GLOBAL STATUS LIKE 'Created_tmp_tables';

#Variável que define o tamanho de memória que as tmp_tables podem ocupar
SHOW GLOBAL VARIABLES LIKE 'tmp_table_size'; #EM BYTES
#Mudar o valor da variável, até que o serviço seja reiniciado, após isso o valor volta para o estabelecido no My.ini
SET GLOBAL tmp_table_size = 16777216; 

