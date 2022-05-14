USE sakila;
select count(actor_id) from actor;

select count(pagamento_id), (select sum(valor)) from pagamento
where cliente_id = 10;

select count(ativo) from cliente
where ativo = 0;

SELECT * FROM sakila.filme JOIN filme_categoria ON filme.filme_id = filme_categoria.filme_id
JOIN categoria ON filme_categoria.categoria_id = categoria.categoria_id WHERE categoria.nome = "Action";

# 10 filmes que mais geram receita 
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

# que não locaram
SELECT * FROM cliente c
LEFT JOIN locacao l ON c.cliente_id = l.cliente_id
WHERE l.cliente_id IS NULL;

/* NIVEL AVANÇADO */
SELECT  
		COUNT(IFNULL(l.locacao_id,0)) AS totallocacoes, 
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