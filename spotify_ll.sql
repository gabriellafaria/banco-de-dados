-- questão 2
SELECT titulo 
	FROM cancao
WHERE titulo LIKE '%z%';

-- questão 3
SELECT titulo 
	FROM cancao
WHERE titulo LIKE '_a%s';

-- questão 4
SELECT  titulo AS 'Título', qtdcancoes 'Quantidade de canções'
	FROM playlist 
    ORDER BY qtdcancoes DESC;
    

-- questão 5
SELECT * 
	FROM usuario
    WHERE Data_nac 
    ORDER BY Data_nac DESC
    LIMIT 5
    OFFSET 10;
    
-- questão 6
SELECT qtdreproducao, titulo
	FROM cancao
    ORDER BY qtdreproducao DESC 
    LIMIT 5;
    
-- questão 7
SELECT * 
	FROM album
    ORDER BY titulo;
    
SELECT * 
	FROM album
    WHERE imagemcapa IS NULL
    ORDER BY titulo;
    
INSERT INTO usuario (
	idUsuario,
	Nomeusuario,
    NomeCompleto,
    senha,
    data_nac,
    sexo,
    Cod,
    Pais_idPais
)
VALUE (
	30,
	'novousuariodespotify@gmail.com',
    'Elmer Santos',
    'S4321m',
    '15/11/1991',
    'M',
    '1002',
    '9'
);

-- questão 10
DELETE FROM generoxcancao
WHERE IdGenero = 9;

-- questão 11
SET SQL_SAFE_UPDATES =0;
UPDATE artista 
	SET imagem ='imagem em falta' 
    WHERE (IFNULL(imagem, '') = '');
    
