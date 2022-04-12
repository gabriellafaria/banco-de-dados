-- 1
select pais, count(id)
from clientes
group by pais;


-- 2 
select count(cancoes.id)
from  cancoes 
group by id_genero
having id_genero = 6;

-- 3 
select SUM(valor_total) from faturas;

-- 4
select avg(duracao_milisegundos) from cancoes
where id_album = 4;

-- 5
select min(bytes) from cancoes;

-- 6
select id_cliente, SUM(valor_total) from faturas
where id_cliente = 6; 

-- queries III
select * from cancoes
where compositor = 'willie dixon' and id_genero = 6;

-- 2
select * from cancoes
where id_genero = 1;

-- 3
select titulo from albuns;

-- 4 
select nome from cancoes
where id_tipo_de_arquivo = 1;

-- 5
select distinct titulo from empregados;

-- 6
select  cancoes.nome, cancoes_playlists.id_cancao, cancoes_playlists.id_playlist, playlists.nome 
from cancoes_playlists
inner join cancoes
inner join playlists;

-- 7
 select distinct concat('A música ', nome, '' 'é composta por ', compositor) from cancoes;
 
 -- 8
 select coalesce(estado_cobranca, pais_cobranca, cep_cobranca) from faturas;
 
 -- 9
 select datediff(data_contratacao, data_nascimento) from empregados;
 
 -- 10
 
 