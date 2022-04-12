1. Fazer uma query para retornar apenas os clientes que têm 3 faturas ou mais
2. Atualizar o campo PrecoUnitario (tabela Produtos) em 20% apenas para os produtos que estão relacionados às faturas dos clientes que têm mais de 3 faturas
3. Criar uma consulta que retorne apenas os produtos cujo campo quantidadeporunidade contenha a palavra 'boxes'
4. Faça uma query que retorne o nome do produto, o nome do fornecedor, nome da categoria e mostre .....
5. Criar uma consulta que mostre a arrecadação total por fatura e ordene os resultados de forma decrescente. Ex.:

fatura 00001
produto 	quantidade 		valor		total
caneca		3				5			15
teclado		1				85			85

total da fatura: 100

6. Criar uma tabela com os produtos dos faturas que tiveram uma arrecadação acima da média do período
7. Criar uma consulta que retorne todos os funcionários. Porém, os funcionários que tiverem o campo 'gestor' igual a NULL deve exibir um hífen em vez de NULL.
8. Aumente 5% o preço (PrecoUnitario da tabela produto) dos 3 produtos menos vendidos
9. Faça uma consulta que retorne o nome e o sobrenome de um empregado, o nome e sobrenome do gestor dele em uma única coluna (nome + sobrenome)
10. Faça uma consulta, com base na anterior, que mostre a quantidade de empregados que estão debaixo da liderança de cada um dos gestores. Ordene de forma crescente.
11. Crie uma query que mostre a quantidade de empregados por mês de nascimento. Mostre o nome do mês por extenso. Ex.:

MES				QtAniversariantes
janeiro			10
fevereiro		1
abril			4

12. Faça uma consulta que liste o nome do produto, nome do cliente, valor total de cada item, quantidade e valor unitario de cada item, mas apenas para as faturas cujo produto seja fornecido por fornecedores da Espanha, Reino Unido (UK), Itália e Canada

13. Crie uma consulta que retorne o nome do país dos fornecedores e o valor total arrecadado. Qual o país que teve maior arrecadação?
14. Faça uma consulta que retorne o nome do cliente e o paisEnvio. Porém, devem ser retornados apenas as faturas cujo pais de envio seja Brasil ou USA.
15. Faça uma consulta que retorne o valor total da fatura considerando o frete (campo transporte da tabela faturas)
16. Faça uma consulta que retorne a quantidade de produtos por categoria. Qual a categoria com mais produtos? E com menos produtos?
17. Faça uma consulta que:
	1. Retorne a diferença em dias entre a data da fatura e a data de envio
	2. Considerando:
		a) apenas as faturas do ano de 1996 ou 1998.
		b) apenas os vendedores que tem menos de 60 anos ou que tem mais de 80 anos
		
18. Faça uma consulta que retorne o total faturado por produto e por categoria. Ex.:
produto		categoria	total
Melancia	Frutas		3000

19. Retorne todas as empresas de correios que não fizeram nenhum envio, ou seja, não possuem faturas. Retorne todas as informações dessas empresas.

20. Retorne apenas as empresas de correios que fizeram algum envio, ou seja, possuem faturas. Retorne todas as informações dessas empresas, retorne o id da fatura, o nome do cliente, nome e sobrenome do empregado que fez a venda, data da fatura, data de envio e a quantidade de dias que levou para a fatura ser processada, ou seja, a diferença entre a data da fatura e a data de envio. Para as faturas não processadas, ou seja, cuja data de envio é 0000-00-00 00:00:00, deve-se mostrar o texto 'Fatura não processada'. Além disso, as seguintes condições devem ser respeitadas:
	a) devem ser consierados apenas as faturas cujo tempo de processamento (data de envio - data da fatura) seja de até 1 semana
	b) somente devem ser consideradas as faturas cujo valor do transporte seja maior que o valor médio
	c) e cujo paisenvio (tabela faturas) seja igual ao pais (tabela clientes)