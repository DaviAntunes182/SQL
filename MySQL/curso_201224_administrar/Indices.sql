#	ÍNDICES - GRAVAM A POSIÇÃO DE CERTOS DADOS. DEVEM SER ATUALIZADOS JUNTO COM A TABELA. 
# 	USAM UM ALGORITMO DE BUSCA PARA ACHAR DADOS NAS TABELAS 
# 	NUMA TABELA INNODB - O INDICE DA CHAVE PRIMÁRIA JÁ É A ORDEM NATURAL, 
#	NO CASO DOS OUTROS CAMPOS AS REFERÊNCIAS É A CHAVE PRIMÁRIA

# 				HASH E BTree - ALGORITMOS DE BUSCA

# BTree É uma árvore binária balanceada, garantindo que os nós estão bem distribuídos(mediana)
# com três raizes , 1- menor que N1, 2- entre N1 e N2, 3- maior que N2

# HASH - Algorítimo que independente de seu tamanho é reduzido a uma palavra tamanho fixo,
#		 Cada palavra é um endereço de memória, e com base nesse endereço iremos buscar os dados
#		 porém cada endereço pode ter vários dados, mas já fizemos um filtro para buscar no endereço certo



#Sem índice
EXPLAIN FORMAT=JSON SELECT* FROM notas_fiscais WHERE DATA_VENDA = '20170101';
#custo - 8849.05

# CRIANDO ÍNDICE - NA COLUNA DATA_VENDA POR QUE ESTAMOS UTILIZANDO ELA DE FILTRO
# TAMBÉM É BOM CRIAR NAS COLUNAS QUE USAMOS QUANDO FAZEMOS JOINS
ALTER TABLE notas_fiscas ADD INDEX (data_venda);
# APAGANDO ÍNDICE
ALTER TABLE notas_fiscas DROP INDEX data_venda;


#Com índice
EXPLAIN FORMAT=JSON SELECT * FROM notas_fiscais WHERE DATA_VENDA = '20170101';
#custo - 60.28

# EXPLAIN NO WORKBENCH -> AO EXECUTAR UMA QUERY PODEMOS IR NO PLANO DE EXECUÇÃO, 4 OPÇÃO A DIREITA