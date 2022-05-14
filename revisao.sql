DROP DATABASE revisao;
CREATE DATABASE revisao;
USE revisao;

CREATE TABLE clientes (
	idCliente INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(30) NOT NULL,
	email VARCHAR(70) NOT NULL,
    telefone CHAR(11) NOT NULL,
    cpf CHAR(11) NOT NULL,
    PRIMARY KEY (idCliente)
);

CREATE TABLE pagamento(
	idPagamento INT NOT NULL AUTO_INCREMENT, 
	descricao VARCHAR(20) NOT NULL, 
    data_pagamento DATE NOT NULL,
    data_registro DATE NOT NULL,
    idCliente INT NOT NULL,
    PRIMARY KEY (idPagamento)
);

ALTER TABLE pagamento ADD CONSTRAINT FK_cliente_pagamento FOREIGN KEY (idCliente)
REFERENCES clientes (idCliente);

DELIMITER $$
CREATE PROCEDURE insecaoDados (IN nome VARCHAR(30), email VARCHAR(70), telefone CHAR(11), cpf CHAR(11))
BEGIN 
	INSERT INTO clientes (nome, email, telefone, cpf)
    VALUES (nome, email, telefone, cpf);
END $$
DELIMITER ;

CALL insecaoDados ('FULANO', 'um@email.com', '11111111111', '12312312311');

DELIMITER $$
CREATE PROCEDURE insecaoDados2 (IN descricao VARCHAR(20), IN data_pagamento DATE, IN data_registro DATE, idCliente INT)
BEGIN 
	INSERT INTO pagamento (descricao, data_pagamento, data_registro, idCliente)
    VALUES (descricao, data_pagamento, data_registro, idCliente);
END $$
DELIMITER ; 

CALL insecaoDados2 ('debito e a vista', '2022-01-12', '2022-02-10', 1);

DELIMITER $$ 
CREATE PROCEDURE Update_clientes (IN nome VARCHAR(30))
BEGIN
   UPDATE clientes
   SET 
   nome = nome WHERE cpf = cpf;
   END $$
DELIMITER ; 

SET SQL_SAFE_UPDATES =0;
CALL Update_clientes ('Eu') ;

SELECT * FROM clientes