/*		PELO MySQLDump
Como armazenar uma base de dados (fazer o dump), deve-se estar no caminho correto
C:\Program Files\MySQL\MySQL Server 8.0\bin
mysqldump -uroot -p --databases banco_de_dados > c:\pasta_para_salvar\arquivo_para_salvar.sql

Como armazenar uma tabela
mysqldump -uroot -p --databases banco_de_dados --tables tabela > c:\pasta_para_salvar\arquivo_para_salvar.sql

Como ignorar uma tabela
mysqldump -uroot -p --databases banco_de_dados --ignore-table banco_de_dados.tabela > c:\pasta_para_salvar\arquivo_para_salvar.sql

Como ignorar uma tabela
mysqldump -uroot -p --databases banco_de_dados --no-create-db --no-create-info --complete-insert > c:\pasta_para_salvar\arquivo_para_salvar.sql

	VANTAGEM: Pode-se configurar um arquivo .bath para automatizar o processo de backup facilmente
*/

# Como congelar o banco para um backup seguro
LOCK INSTANCE FOR BACKUP;

#Exportar pelo Wizard!
#Exportar banco de dados como um todo -> Administration -> Data Export -> Export to Self-Contained File -> c:\pasta_para_salvar\arquivo_para_salvar.sql
#Exportar tabelas separadamente -> Administration -> Data Export -> Export to Dump Project Folder -> c:\pasta_para_salvar

#Descongelando
UNLOCK INSTANCE;

#Vantagem: É mais fácil
#Desvantagem: Não se pode automatizar esse processo facilmente
/*				Passo a passo de um backup

1- LOCK INSTANCE FOR BACKUP;
2- Criar um diretório para fazer o backup
3- Copiar o arquivo de inicialização do MySQL -> C:\Program Data\MySQL\MySQL 8.0\my.ini para o diretório de backup
4- Copiar o diretório data inteiro -> C:\Program Data\MySQL\MySQL 8.0\Data
5- UNLOCK INSTANCE;

Vantagem: Previsível, Bom tempo de uso
Desvantagem: Pouco segura

******************Para um backup seguro devemos fazer os dois tipos de backup**************************
*/ 