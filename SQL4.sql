USE emarket;
SELECT * FROM clientes;
SELECT 
F.FaturaId AS ID_FATURA,
F.DataFatura  AS DATA_FATURA,
C.EMPRESA AS TRANSPORTADORA,
CLI.EMPRESA AS NOME_CLIENTE,
CT.CATEGORIANOME AS NOME_CATEGORIA,
P.PRODUTONOME AS NOME_PRODUTO,
P.PRECOUNITARIO AS PRECO_UNITARIO,
P.QUANTIDADEPORUNIDADE AS QUANTIDADE
FROM FATURAS AS F
INNER JOIN CORREIOS AS C  ON C.CORREIOID = F.FORMAENVIO
INNER JOIN  CLIENTES AS CLI   ON CLI.CLIENTEID = F.CLIENTEID 
INNER JOIN DETALHEFATURA AS DF ON DF.FATURAID = F.FATURAID
INNER JOIN PRODUTOS P ON P.PRODUTOID = DF.PRODUTOID
INNER JOIN CATEGORIAS CT ON CT.CATEGORIAID = P.CATEGORIAID

-- Relatórios II parte II - INNER, LEFT e RIGHT JOIN
-- 1.    Liste todas as categorias junto com informações sobre seus produtos. Incluir todas as categorias, mesmo que não tenham produtos.
SELECT *
FROM
CATEGORIAS CT
LEFT JOIN PRODUTOS P ON P.CATEGORIAID = CT.CATEGORIAID 
;

-- 2.    Liste as informações de contato de clientes que nunca compraram no emarket.
SELECT C. *
FROM FATURAS F
RIGHT JOIN CLIENTES C ON F.CLIENTEID = C.CLIENTEID
WHERE F.CLIENTEID IS NULL;


-- 3. Faça uma lista de produtos. Para cada um, indique seu nome, categoria e as informações de contato de seu fornecedor. 
-- Lembre-se que podem existir produtos para os quais o fornecedor não foi indicado.

select 
P.PRODUTONOME, 
CT.CATEGORIANOME, 
PRO.CONTATO, 
PRO.TELEFONE
from PRODUTOS P
INNER Join CATEGORIA CT ON CT.CATEGORIAID = P.CATEGORIAID
inner join PROVEDORES PRO ON PRO.PROVEDORID = P.PROVEDORID
;

-- ex 5 - III

select c.empresa as nomecliente,
c.clienteid,
MAX(f.datafatura) as ultimafatura
FROM clientes as c
left join faturas f on c.clienteid = f.clienteid
group by  c.empresa,
c.clienteid