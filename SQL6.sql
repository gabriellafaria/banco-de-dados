USE sakila;
-- 1 Gere um relatório que responda à pergunta: quais são os dez clientes que mais gastam e quantos aluguéis fizeram?

SELECT SUM(p.valor) AS valorTotal, c.nome, count(p.pagamento_id) AS 'quantos alugueis'
FROM cliente AS c
INNER JOIN pagamento AS p ON p.cliente_id = c.cliente_id
GROUP BY c.nome
ORDER BY valorTotal desc
LIMIT 10;

/* 2 Gere um relatório que indique: a identificação do cliente, o número de locações e o valor
total para todos os clientes que gastaram mais de $ 150  em locações.*/

SELECT SUM(p.valor) AS valorTotal, c.cliente_id, count(l.locacao_id) AS 'quantidade de locações'
FROM cliente AS c
INNER JOIN pagamento AS p ON p.cliente_id = c.cliente_id
INNER JOIN locacao AS l ON l.cliente_id = c.cliente_id AND l.locacao_id = p.locacao_id
GROUP BY c.nome
HAVING valorTotal > 150;

/* 3 Gere um relatório que responda à pergunta: Como se distribui a quantidade e o 
valor total das locações nos meses pertencentes ao ano  de 2005? (Tabela pagamento). */
SELECT
  MONTH(pagamento.data_pagamento) AS mes,
  COUNT(pagamento.locacao_id) AS qtdLocacao,
  SUM(pagamento.valor) AS valorTotal
FROM pagamento
GROUP BY mes
HAVING mes = 5;

-- questão 3 de outra forma:
SELECT 
	COUNT(*) AS qtdLocacoes,
    SUM(amount),
    EXTRACT(MONTH FROM payment_date) AS mes
FROM payment
WHERE payment_date BETWEEN '2005-01-01' AND '2005-12-31'
GROUP BY mes;

/* 4 Gere um relatório que responda à pergunta: quais são os 5 inventários mais locados? (coluna inventario_id na tabela de locações)
 Para cada um deles, indique o valor das locações. */
 SELECT COUNT(*) AS qtdLocacoes, SUM(p.amount) AS valorTotal, r.inventory_id
 FROM rental r
 INNER JOIN payment p ON r.rental_id = p.rental_id
 GROUP BY r.inventory_id
 ORDER BY qtdLocacoes DESC
 LIMIT 5;
 
 /* Parte II 
 1- Gere um relatório que responda à pergunta: quais são os dez clientes que mais gastam e quantos aluguéis fizeram?  */


/* Gere um relatório que responda à pergunta: quais são os 10 filmes que mais geram receita? E quais são os que geram menos receita? 
Para cada um deles, indique a quantidade de locações. */
 SELECT  
		SUM(p.valor) AS total,
		COUNT(l.locacao_id) AS totallocacoes, 
		f.filme_id,
        f.titulo
FROM inventario i 
JOIN filme f 
	ON i.filme_id = f.filme_id
JOIN locacao l
	ON l.inventario_id = i.inventario_id
JOIN pagamento p
	ON p.locacao_id = l.locacao_id
GROUP BY f.filme_id,
        f.titulo
ORDER BY filme_id 
LIMIT 10;

/* Existem clientes que não locaram  filmes? */
SELECT * FROM cliente c
LEFT JOIN locacao l ON c.cliente_id = l.cliente_id
WHERE l.cliente_id IS NULL;

SELECT f.titulo AS 'Titulo do Filme', COUNT(f.titulo) AS 'Numero de Locacoes'
FROM filme f
LEFT JOIN inventario i ON i.filme_id = f.filme_id
GROUP BY f.titulo
ORDER BY COUNT(f.titulo);

select * from pagamento
order by data_pagamento 
