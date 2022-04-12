

-- ex 1
SELECT MAX(valor_total), cidade_cobranca FROM faturas
GROUP BY cidade_cobranca
HAVING cidade_cobranca = 'oslo';

-- 2
SELECT MIN(valor_total) FROM faturas;

-- 3
SELECT AVG(valor_total), pais_cobranca FROM faturas
GROUP BY pais_cobranca
HAVING pais_cobranca = 'Canada';

-- 4 
SELECT COUNT(id), pais_cobranca FROM faturas
GROUP BY pais_cobranca
HAVING pais_cobranca = 'Canada';

-- 5 
SELECT SUM(valor_total) AS total FROM faturas;

-- 6 
SELECT id, data_fatura, valor_total FROM faturas
WHERE valor_total < (SELECT AVG(valor_total) FROM faturas)
ORDER BY valor_total;

-- 7 
SELECT MAX(data_nascimento) FROM empregados;

-- 8 
SELECT MIN(data_nascimento) FROM empregados;

-- 9 
SELECT DATE_FORMAT(data_nascimento, '%d %M %Y') FROM empregados;

-- 10
SELECT COUNT(id), compositor FROM cancoes
GROUP BY compositor
HAVING compositor = 'AC/DC';

-- 11
SELECT AVG(duracao_milisegundos) FROM cancoes;

-- 12
SELECT AVG(bytes), compositor FROM cancoes
GROUP BY compositor
HAVING compositor = 'AC/DC';

-- 13
SELECT COUNT(id), cidade FROM clientes
GROUP BY cidade
HAVING cidade = 'São Paulo'

-- 14 
