#Recuperando Backup

/*	De um arquivo SQL pelo CMD C:\Program Files\MySQL\MySQL Server 8.0\bin
	COMANDO: mysql -uroot -p < c:\pasta_do_backup\arquivo_backup.sql

	De uma pasta Data
    Interromper serviço do mysql
    Copiar o my.ini do diretório fonte
    Colar no diretório destino -> C:\Program Files\MySQL\MySQL Server 8.0
    
    SE OCORRER ALGUM ERRO, ALGUMA CORRUPÇÃO DE DADOS, PODEMOS USAR O ARQUIVO DE BACKUP
    DO MYSQLDUMP PARA COMPLEMETAR ESSES DADOS FALTANTES
*/