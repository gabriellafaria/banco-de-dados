USE emarket;
# 1 Fazer uma query para retornar apenas os clientes que têm 3 faturas ou mais
SELECT
    COUNT(1) AS qtdFaturas,
    c.empresa AS nomeCliente
FROM clientes AS c
JOIN faturas AS f
    ON c.ClienteID = f.ClienteID
GROUP BY
    c.clienteId,
    c.empresa
HAVING COUNT(1) >= 3
ORDER BY qtdFaturas;

# 2 Atualizar o campo PrecoUnitario (tabela Produtos) em 20% apenas para os produtos que estão relacionados às faturas dos clientes que têm mais de 3 faturas
UPDATE produtos SET precoUnitario = precoUnitario * 1.2
WHERE produtoID IN (
SELECT DISTINCT det.ProdutoID
    FROM faturas
	JOIN detalhefatura AS det
	ON faturas.FaturaId = det.FaturaId
    WHERE faturas.clienteID IN (
    SELECT COUNT(1) AS qtdFaturas, c.empresa AS nomeCliente
FROM clientes AS c
JOIN faturas AS f
    ON c.ClienteID = f.ClienteID
GROUP BY
    c.clienteId,
    c.empresa
HAVING COUNT(1) >= 3
ORDER BY qtdFaturas
    )
);

-- 3
SELECT * FROM produtos 
WHERE quantidadeporunidade LIKE '%boxes%';

-- 5
SELECT clientes.empresa, faturas.faturaID, SUM(detalhefatura.quantidade * detalhefatura.precounitario) AS totalfatura FROM clientes
JOIN faturas ON clientes.clienteid = faturas.clienteid
JOIN detalhefatura ON detalhefatura.faturaid = faturas.faturaid
GROUP BY clientes.empresa, faturas.faturaID
ORDER BY totalfatura DESC;

-- 7
# usar CASE WHEN gestor IS NULL '-'

-- 8 
UPDATE produtos 
SET precoUnitario = precoUnitario * 1.05;

SELECT produtoid FROM (
SELECT COUNT(*) AS qtdP, produtoid FROM detalhefatura AS df
GROUP BY produtoid
ORDER BY qtdP ASC
LIMIT 3) AS tbl;